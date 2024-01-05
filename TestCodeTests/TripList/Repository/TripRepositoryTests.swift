//
//  TripRepositoryTests.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import XCTest
@testable import TestCode
import Combine

final class TripRepositoryTests: XCTestCase {

    var providerMock: TripNetworkProviderMock!
    var sut: TripRepositoryImpl!
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        providerMock = TripNetworkProviderMock()
        sut = TripRepositoryImpl(provider: providerMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    

    func test_fetchTripsShouldSuccess() {
        let expectation = XCTestExpectation(description: "Fetch trips successfully")
        
        let tripWithWrongDate = TripApiModel.wrongDateMock
        let tripApiMock = TripApiModel.mock
        
        providerMock.publisher = Just([tripWithWrongDate, tripApiMock]).setFailureType(to:  Error.self).eraseToAnyPublisher()

        let result = sut.fetchTrips()

        result.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure:
                XCTFail("Expected successful trip fetch")
            }
        }, receiveValue: { trips in
            if let trip = trips.first {
                XCTAssertEqual(trip.route, tripApiMock.route)
            } else {
                XCTFail("Expected successful trip fetch")
            }
            expectation.fulfill()
        })
        .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchTripsShouldFailWithWrongDates() {
        let expectation = XCTestExpectation(description: "Fetch trips fails")
        let tripWithWrongDate = TripApiModel.wrongDateMock

        providerMock.publisher = Just([tripWithWrongDate]).setFailureType(to:  Error.self).eraseToAnyPublisher()

        let result = sut.fetchTrips()

        result.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure:
                XCTFail("Expected successful trip fetch")
            }
        }, receiveValue: { trips in
            XCTAssertTrue(trips.isEmpty)
            expectation.fulfill()
        })
        .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchTripsShouldFail() {
        let expectation = XCTestExpectation(description: "Fetch trips failure")

        providerMock.publisher = Fail(error: BasicError.networkError).eraseToAnyPublisher()

        let result = sut.fetchTrips()

        result.sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                XCTAssertEqual(error, BasicError.networkError)
                expectation.fulfill()
            }
        }, receiveValue: { _ in
            XCTFail("Expected fetch to fail, but it succeeded")
        })
        .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_getStopInfoShouldFail() {
        let expectation = XCTestExpectation(description: "StopInfo failure")

        providerMock.stopInfoPublisher = Fail(error: BasicError.networkError).eraseToAnyPublisher()

        let result = sut.getStopInfo(id: 1)

        result.sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                XCTAssertEqual(error, BasicError.networkError)
                expectation.fulfill()
            }
        }, receiveValue: { _ in
            XCTFail("Expected fetch to fail, but it succeeded")
        })
        .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_getStopInfoShouldSuccess() {
        let expectation = XCTestExpectation(description: "Get Stop info success")
        
        providerMock.stopInfoPublisher = Just(StopInfoApiModel.mock).setFailureType(to:  Error.self).eraseToAnyPublisher()

        let result = sut.getStopInfo(id: 1)

        result.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure:
                XCTFail("Expected successful trip fetch")
            }
        }, receiveValue: { stopInfo in
            XCTAssertEqual(stopInfo.userName, StopInfoApiModel.mock.userName)
            expectation.fulfill()
        })
        .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}
