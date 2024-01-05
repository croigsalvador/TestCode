//
//  GetStopInfoMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
@testable import TestCode
import Combine

class GetStopInfoMock: GetStopInfo {
    
    var publisher: AnyPublisher<StopInfo, BasicError>!
    
    func getInfo(id: Int) -> AnyPublisher<TestCode.StopInfo, TestCode.BasicError> {
        return publisher
    }
}
