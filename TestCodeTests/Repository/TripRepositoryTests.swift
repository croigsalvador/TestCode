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
    
    var tripApiMock: TripApiModel {
        return TripApiModel(id: 213, driverName: "Test", description: "This is a test model", startTime: "", endTime: "", address: "", point: PointApiMpodel(latitude: 12.2, longitude: 23.9))
    }

    func testFetchTripsSuccess() {
        let expectation = XCTestExpectation(description: "Fetch trips successfully")
        
        let tripWithDate = TripApiModel(id: 21223, driverName: "Test", description: "This is a test model", startTime: "2018-12-18T08:00:00.000Z", endTime: "2018-12-18T09:00:00.000Z", address: "", point: PointApiMpodel(latitude: 12.2, longitude: 23.9))
        
        providerMock.publisher = Just([tripApiMock, tripWithDate]).setFailureType(to:  Error.self).eraseToAnyPublisher()

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
                XCTAssertEqual(trip.id, tripWithDate.id)
            } else {
                XCTFail("Expected successful trip fetch")
            }
            expectation.fulfill()
        })
        .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchTripsFailWithWrongDates() {
        let expectation = XCTestExpectation(description: "Fetch trips fails")

        providerMock.publisher = Just([tripApiMock]).setFailureType(to:  Error.self).eraseToAnyPublisher()

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
    
    func testFetchWeatherFailure() {
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
}
