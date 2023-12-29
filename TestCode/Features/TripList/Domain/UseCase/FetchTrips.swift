//
//  FetchTrips.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation
import Combine

protocol FetchTrips {
    func fetchTrips() -> AnyPublisher<[Trip], Error>    
}
