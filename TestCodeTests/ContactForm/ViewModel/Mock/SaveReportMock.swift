//
//  SaveReportMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation
@testable import TestCode

class SaveReportMock: SaveReport {
        
    var reportSaved = false
    
    func save(_ report: Report) {
        reportSaved = true 
    }
    
}
