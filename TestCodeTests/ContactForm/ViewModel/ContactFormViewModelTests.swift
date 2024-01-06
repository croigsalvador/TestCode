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
    var saveReportMock: SaveReportMock!
    var sut: ContactFormViewModel!

    override func setUpWithError() throws {
        saveReportMock = SaveReportMock()
        sut = ContactFormViewModel(saveReport: saveReportMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }


    func test_saveReportShouldBeCalled() {
        sut.send()
        
        XCTAssertTrue(saveReportMock.reportSaved)
    }

}
