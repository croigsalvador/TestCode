//
//  ContactFormViewModelTests.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import XCTest
@testable import TestCode
import Combine

final class ContactFormViewModelTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
    var viewStateMock: ContactFormViewStateMock!
    var saveReportMock: SaveReportMock!
    var coordinatorMock: ReportCoordinatorMock!
    var sut: ContactFormViewModel!

    override func setUpWithError() throws {
        viewStateMock = ContactFormViewStateMock()
        saveReportMock = SaveReportMock()
        coordinatorMock = ReportCoordinatorMock()
        sut = ContactFormViewModel(viewState: viewStateMock, coordinator: coordinatorMock, saveReport: saveReportMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_saveReportShouldBeCalled() {
        viewStateMock.nextStepEnabled = true
        
        sut.send()
        
        XCTAssertTrue(saveReportMock.reportSaved)
    }
    
    func test_userDidPressBackeShouldCallTripListCoordinator() {
        sut.back()
        XCTAssertTrue(coordinatorMock.wasCalled)
    }

}
