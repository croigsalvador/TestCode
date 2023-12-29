//
//  TripListViewModelTests.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import XCTest
@testable import TestCode
import Combine

final class TripListViewModelTests: XCTestCase {
    
    var viewStateMock: TripListViewStateMock!
    var fetchTripsMock: FetchTripsMock! 
    var sut: TripListViewModel!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        viewStateMock = TripListViewStateMock()
        fetchTripsMock = FetchTripsMock()
        sut = TripListViewModel(viewState: viewStateMock, fetchTrips: fetchTripsMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    var tripsMock: [Trip] {
        return [Trip(tripId: 123, driverName: "Juan", description: "test", endTime: "2018-12-18T09:00:00.000Z", startTime: "2018-12-18T08:00:00.000Z", address: "Santa maria di popolo", point: Point(latitude: 23, longitude: 23))]
    }
    
    func test_viewStateShouldStartLoading() throws {
        
        viewStateMock.$listState.dropFirst().sink { state in
            XCTAssertTrue(state == .loading)
        }.store(in: &cancellables)
        
        sut.onAppear()
    }
    
    func test_onAppearShouldCallFetchTripsAndReturnLoadedState() {
        
        let expectation = XCTestExpectation(description: "Fetch trips expectation")
        
        fetchTripsMock.publisher = .just(tripsMock).eraseToAnyPublisher()
        
        viewStateMock.$listState.dropFirst(2).sink { state in
            XCTAssertTrue(state == .loaded)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.onAppear()
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func test_onAppearShouldCallFetchTripsAndReturnErrorState() {
        
        let expectation = XCTestExpectation(description: "Fetch trips error expectation")
        
        fetchTripsMock.publisher = .fail(BasicError.unknownError).eraseToAnyPublisher()
        
        viewStateMock.$listState.dropFirst(2).sink { state in
            XCTAssertTrue(state == .error)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.onAppear()
        
        wait(for: [expectation], timeout: 2.0)
    }
}
