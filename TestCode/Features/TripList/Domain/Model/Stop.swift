//
//  Stop.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

struct Stop: Annotatable {
    let id: Int?
    let point: Point
    let type: StopType = .stop
}
