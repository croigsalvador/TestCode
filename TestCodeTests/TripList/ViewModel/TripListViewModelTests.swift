//
//  TripListViewModelTests.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import XCTest
@testable import TestCode
import Combine
import MapKit

final class TripListViewModelTests: XCTestCase {
    
    var fetchTripsMock: FetchTripsMock!
    var getTripLocationsMock: GetTripLocationsMock!
    var regionCalculatorMock: RegionCalculatorMock!
    var mapStateMock: MapStateMock!
    var sut: TripListViewModel!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        fetchTripsMock = FetchTripsMock()
        getTripLocationsMock = GetTripLocationsMock()
        regionCalculatorMock = RegionCalculatorMock()
        mapStateMock = MapStateMock()
        sut = TripListViewModel(mapState: mapStateMock, fetchTrips: fetchTripsMock, getTripLocations: getTripLocationsMock, regionCalculator: regionCalculatorMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    var tripsMock: [Trip] {
        return [Trip.mock]
    }
    
    func test_viewStateShouldStartLoading() throws {
        
        fetchTripsMock.publisher = .just(tripsMock).eraseToAnyPublisher()
        
        sut.$listState.dropFirst().sink { state in
            XCTAssertTrue(state == .loading)
        }.store(in: &cancellables)
        
        sut.onAppear()
    }
    
    func test_onAppearShouldCallFetchTripsAndReturnLoadedState() {
        
        let expectation = XCTestExpectation(description: "Fetch trips expectation")
        
        fetchTripsMock.publisher = .just(tripsMock).eraseToAnyPublisher()
        
        sut.$listState.dropFirst(2).sink { state in
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
        
        sut.$listState.dropFirst(2).sink { state in
            XCTAssertTrue(state == .error)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.onAppear()
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func test_mapStateRegionShouldContainNewCoordinates() throws {
        let newCoordinate = CLLocationCoordinate2D(latitude: 23.9292, longitude:-0.232)
       
        var region = MKCoordinateRegion()
        region.center = newCoordinate
       
        regionCalculatorMock.region = region
        getTripLocationsMock.coordinates = [newCoordinate]
        
        mapStateMock.$mapRegion.dropFirst().sink { mapRegion in
            XCTAssertTrue(mapRegion.center.latitude == newCoordinate.latitude && mapRegion.center.longitude == newCoordinate.longitude)
        }.store(in: &cancellables)
        
        sut.userDidSelect(uiModel: TripUIModel(trip: tripsMock.first!))
    }
    
    func test_mapStateAnnotationsShouldContainNewCoordinates() throws {
        let newCoordinate = CLLocationCoordinate2D(latitude: 23.9292, longitude:-0.232)
       
        var region = MKCoordinateRegion()
        region.center = newCoordinate
       
        regionCalculatorMock.region = region
        getTripLocationsMock.coordinates = [newCoordinate]
        
        mapStateMock.$annotations.dropFirst().sink { annotations in
            if let annotation = annotations.first {
                XCTAssertTrue(annotation.coordinate.latitude == newCoordinate.latitude && annotation.coordinate.longitude == newCoordinate .longitude)
            }        }.store(in: &cancellables)
        
        sut.userDidSelect(uiModel: TripUIModel(trip: tripsMock.first!))
    }
    

}
