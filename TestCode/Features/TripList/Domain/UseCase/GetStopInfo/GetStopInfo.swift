//
//  GetStopInfo.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import Combine

protocol GetStopInfo {
    func getInfo(id: Int) -> AnyPublisher<StopInfo, BasicError>
}
