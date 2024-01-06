//
//  StopInfoUIModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation

struct StopInfoUIModel {
    
    let stopInfo: StopInfo
  
    var address: String {
        "Address: \(stopInfo.address)"
    }
    
    var paid: String {
        stopInfo.paid ? "Paid" : "Unpaid"
    }
    
    var price: String {
        "Price: \(stopInfo.price)€"
    }
    
    var userName: String {
        "User: \(stopInfo.userName)"
    }
}
