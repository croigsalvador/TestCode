//
//  ReportRepository.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import XCTest
@testable import TestCode

final class ReportRepositoryTests: XCTestCase {

    var sut: ReportRepositoryImpl<ReportUserDefaultsCacheMock<ReportDataModel>>!
    var cacheMock:  ReportUserDefaultsCacheMock<ReportDataModel>!
    
    override func setUpWithError() throws {
        cacheMock = ReportUserDefaultsCacheMock<ReportDataModel>()
        sut = ReportRepositoryImpl(cache: cacheMock)
    }
    
    func test_saveReportShouldCallCacheSaveMethod() {
        let report = Report(name: "Test", surname: "Surname", email: "test@test.com", phone: nil, description: "This is a description", date: Date())
        
        sut.save(report)
                
        XCTAssertTrue(cacheMock.saveWasCalled)
    }

}
