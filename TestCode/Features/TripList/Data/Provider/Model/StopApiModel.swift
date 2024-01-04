//
//  StopApiModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

struct StopApiModel: Codable {
    let id: Int?
    let point: PointApiModel?
    
    func toDomainModel() -> Stop? {
        guard let id = id, let point = point else { return nil }
        return Stop(id: id, point: point.toDomainModel())
    }
}
