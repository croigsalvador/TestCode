//
//  TripApiModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

struct TripApiModel: Codable {
    let id: Int
    let driverName: String
    let description: String
    let startTime: String
    let endTime: String
    let address: String
    let point: PointApiMpodel
    
}

struct PointApiMpodel: Codable {
    let latitude: Double
    let longitude: Double
}

extension TripApiModel {
    func toDomainModel() -> Trip? {
        
        guard let startDate = startTime.toDate(),
            let endDate = endTime.toDate()
        else { return nil }
              
        return Trip(id: self.id, driverName: self.driverName, description: self.description, startDate: startDate, endDate: endDate, address: self.address, point: Point(latitude: point.latitude, longitude: point.longitude))
    }
}
