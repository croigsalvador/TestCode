//
//  CacheProtocol.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation

protocol CacheProtocol {
    associatedtype Value

    func saveValue(_ value: Value)
    func fetchValues(completion: @escaping (([Value]?) -> ())) 
}
