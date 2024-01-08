//
//  ContactFormViewState.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation


class ContactFormViewState: ObservableObject {
    
    @Published var nameText: String = ""
    @Published var nameTextIsValid: Bool = false
    @Published var surnameText: String = ""
    @Published var surnameTextIsValid: Bool = false
    @Published var emailText: String = ""
    @Published var emailTextIsValid: Bool = false
    @Published var phoneText: String = ""
    @Published var descriptionText: String = ""
    @Published var descriptionTextIsValid: Bool = false
    @Published var nextStepEnabled = false
    @Published var hideKeyBoard = false
    
    func reset() {
        nameText = ""
        nameTextIsValid = false
        surnameText = ""
        surnameTextIsValid = false
        emailText = ""
        emailTextIsValid = false
        phoneText = ""
        descriptionText = ""
        descriptionTextIsValid = false
        nextStepEnabled = false
        hideKeyBoard = true
    }
}
    
    
