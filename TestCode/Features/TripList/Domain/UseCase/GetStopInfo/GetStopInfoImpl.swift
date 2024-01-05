//
//  GetStopInfoImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import Combine

struct GetStopInfoImpl: GetStopInfo {
    
    let repository: TripRepository
    
    func getInfo(id: Int) -> AnyPublisher<StopInfo, BasicError> {
        return .fail(.networkError)
    }
    
}
