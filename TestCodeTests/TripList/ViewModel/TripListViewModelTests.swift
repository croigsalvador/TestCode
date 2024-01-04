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
    
    var fetchTripsMock: FetchTripsMock!
    var sut: TripListViewModel!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        fetchTripsMock = FetchTripsMock()
        sut = TripListViewModel(fetchTrips: fetchTripsMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    var tripsMock: [Trip] {
        return [Trip.mock]
    }
    
    func test_viewStateShouldStartLoading() throws {
        
        fetchTripsMock.publisher = .just(tripsMock).eraseToAnyPublisher()
        
        sut.$viewState.dropFirst().sink { state in
            XCTAssertTrue(state == .loading)
        }.store(in: &cancellables)
        
        sut.onAppear()
    }
    
    func test_onAppearShouldCallFetchTripsAndReturnLoadedState() {
        
        let expectation = XCTestExpectation(description: "Fetch trips expectation")
        
        fetchTripsMock.publisher = .just(tripsMock).eraseToAnyPublisher()
        
        sut.$viewState.dropFirst(2).sink { state in
            if case .loaded(let trips) = state {
                XCTAssertTrue(!trips.isEmpty)
            } 
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.onAppear()
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func test_onAppearShouldCallFetchTripsAndReturnErrorState() {
        
        let expectation = XCTestExpectation(description: "Fetch trips error expectation")
        
        fetchTripsMock.publisher = .fail(BasicError.unknownError).eraseToAnyPublisher()
        
        sut.$viewState.dropFirst(2).sink { state in
            XCTAssertTrue(state == .error)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.onAppear()
        
        wait(for: [expectation], timeout: 2.0)
    }
}
