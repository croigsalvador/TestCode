//
//  PointApiModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

struct PointApiModel: Codable {
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "_latitude"
        case longitude = "_longitude"
    }
    
    func toDomainModel() -> Point {
        return Point(latitude: latitude, longitude: longitude)
    }
}
