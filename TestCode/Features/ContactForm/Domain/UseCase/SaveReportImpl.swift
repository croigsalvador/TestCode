//
//  SaveReportImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation

struct SaveReportImpl: SaveReport {
    
    private let repository: ReportRepostory
    
    init(_ repository: ReportRepostory) {
        self.repository = repository
    }
    
    func save(_ report: Report) {
        
    }
    
}
