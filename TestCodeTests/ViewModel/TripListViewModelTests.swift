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
    var sut: TripListViewModel!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        viewStateMock = TripListViewStateMock()
        sut = TripListViewModel(viewState: viewStateMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_viewStateShouldStartLoading() throws {
        
        viewStateMock.$listState.dropFirst().sink { state in
            XCTAssertTrue(state == .loading)
        }.store(in: &cancellables)
        
        sut.onAppear()
    }
}
