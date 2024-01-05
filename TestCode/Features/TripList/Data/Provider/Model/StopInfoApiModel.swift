//
//  StopInfoApiModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation

struct StopInfoApiModel: Codable {
    let price: Double
    let address: String
    let tripId: Int
    let paid: Bool
    let stopTime: String
    let point: PointApiModel
    let userName: String
    
    func toDomainModel() -> StopInfo? {
        
        guard let stopDate = stopTime.toDate() else { return nil}
        
        return StopInfo(
            price: price,
            address: address,
            tripId: tripId,
            paid: paid,
            stopTime: stopDate,
            point:point.toDomainModel(),
            userName: userName
        )
    }
}
