//
//  ReportRepositoryImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation

final class ReportRepositoryImpl<Cache:CacheProtocol>: ReportRepostory {
    
    fileprivate let cache: Cache
    
    init(cache: Cache) {
        self.cache = cache
    }
    
    func save(_ report: Report) {
        cache.saveValue(report.toDataModel() as! Cache.Value)
    }
}
