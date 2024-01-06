//
//  UserDefaultsCache.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation

class ReportUserDefaultsCache<Value>: CacheProtocol {
    
    typealias Value = ReportDataModel
    
    private let userDefaults: UserDefaults
    private let queue = DispatchQueue(label: "")
    private let reportsKey = "ReportsKey"
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func saveValue(_ value: ReportDataModel){
        queue.sync { [weak self] in
            guard let self = self else { return }
            self.fetchValues { reports in
                var reportList = reports ?? []
                reportList.append(value)

                if let reportsEncoded = try? PropertyListEncoder().encode(reportList) {
                    self.userDefaults.set(reportsEncoded, forKey: self.reportsKey)
                }
            }
        }
    }
    
    func fetchValues(completion: @escaping ([ReportDataModel]?) -> ()) {
        queue.sync { [weak self] in
            guard let self = self else { return }

            guard let data = self.userDefaults.object(forKey: self.reportsKey) as? Data,
                  let reports = try? PropertyListDecoder().decode([ReportDataModel].self, from: data) else {
                completion(nil)
                return
            }
            
            completion(reports)
        }
    }
}
