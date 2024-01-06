//
//  Feedback.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation

struct Report {
    let name: String
    let surname: String
    let email: String
    let phone: String?
    let description: String
    let date: Date
}

extension Report {
    func toDataModel() -> ReportDataModel {
        return ReportDataModel(name: name, surname: surname, email: email, phone: phone ?? "", description: description)
    }
}
