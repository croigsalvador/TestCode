//
//  InMemoryCache.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation

class InMemoryCache<Value>: CacheProtocol {
    
    private var elements: [Value] = []
    private let queue = DispatchQueue(label: "")
    
    func saveValue(_ value: Value){
        queue.sync { [weak self] in
            self?.elements.append(value)
        }
    }
    
    func fetchValues(completion: @escaping ([Value]?) -> ()) {
        queue.sync { [weak self] in
            completion(self?.elements)
        }
    }
}
