//
//  ReportUserDefaultsCacheMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation
@testable import TestCode

final class ReportUserDefaultsCacheMock<Value>: CacheProtocol {
    
    var saveWasCalled = false
    var values: [Value]?
    
    func saveValue(_ value: Value){
        saveWasCalled = true
    }
    
    func fetchValues(completion: @escaping ([Value]?) -> ()) {
        completion(values)
    }
    
}
