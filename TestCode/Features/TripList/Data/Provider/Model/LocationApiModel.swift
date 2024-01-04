//
//  LocationApiModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

struct LocationApiModel: Codable {
    let address: String
    let point: PointApiModel
    
    func toDomainModel() -> Location {
        return Location(address: address, point: point.toDomainModel())
    }
}
