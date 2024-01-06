//
//  TripApiModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

struct TripApiModel: Codable {
    
    let driverName: String
    let status: String
    let route: String
    let startTime: String
    let endTime: String
    let origin: LocationApiModel
    let destination: LocationApiModel
    let stops: [StopApiModel]?
    let description: String
    
    func toDomainModel() -> Trip? {
        
        guard let startDate = startTime.toDate(),
              let endDate = endTime.toDate()
        else { return nil }
        
        return Trip(
            driverName: driverName,
            status: status,
            route: route,
            startTime: startDate,
            endTime: endDate,
            origin: origin.toDomainModel(type: .origin),
            destination: destination.toDomainModel(type: .origin),
            stops: stops.map { $0.compactMap { $0.toDomainModel()} },
            description: description)
    }
}



