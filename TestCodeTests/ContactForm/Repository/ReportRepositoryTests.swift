//
//  ReportRepository.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import XCTest
@testable import TestCode

final class ReportRepositoryTests: XCTestCase {

    var sut: ReportRepositoryImpl<InMemoryCacheMock<Report>>!
    var cacheMock: InMemoryCacheMock<Report>!
    
    override func setUpWithError() throws {
        cacheMock = InMemoryCacheMock<Report>()
        sut = ReportRepositoryImpl(cache: cacheMock)
    }
    
    func test_saveReportShouldCallCacheSaveMethod() {
        let report = Report(name: "Test", surname: "Surname", email: "test@test.com", phone: nil, description: "This is a description", date: Date())
        cacheMock.values = [report]
        
        sut.save(report)
                
        XCTAssertTrue(cacheMock.saveWasCalled)
    }

}
