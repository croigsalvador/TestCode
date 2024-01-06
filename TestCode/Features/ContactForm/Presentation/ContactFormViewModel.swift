//
//  ContactFormViewModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation
import Combine

class ContactFormViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let saveReport: SaveReport
    
    init(saveReport: SaveReport) {
        self.saveReport = saveReport
    }
    
    func onAppear() {
        
    }
    
    func send() {
        let report = Report(name: "Test", surname: "Surname", email: "email@sdas.es", phone: nil, description: "description")
        saveReport.save(report)
    }
    
}
