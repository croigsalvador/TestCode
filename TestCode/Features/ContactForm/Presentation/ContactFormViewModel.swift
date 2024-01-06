//
//  ContactFormViewModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation
import Combine

class ContactFormViewModel: ObservableObject {
    
    @Published var viewState: ContactFormViewState
    private var cancellables: Set<AnyCancellable> = []
    private let saveReport: SaveReport
    
    init(viewState: ContactFormViewState, saveReport: SaveReport) {
        self.viewState = viewState
        self.saveReport = saveReport
        setupSubscribers()
        
    }
    
    func onAppear() {
        
    }
    
    func send() {
        if viewState.nextStepEnabled {
            let report = Report(name: viewState.nameText, surname: viewState.surnameText, email: viewState.emailText, phone: nil, description: viewState.descriptionText, date: Date())
            saveReport.save(report)
        }
    }
    
    private func setupSubscribers() {
        addNameValidationSubscriber()
        addSurnameValidationSubscriber()
        addEmailValidationSubscriber()
        addDescriptionValidationSubscriber()
        addButtonSubscriber()
    }
    
    private func addNameValidationSubscriber() {
        viewState.$nameText
            .debounce(for: 0.2, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map({ (text) -> Bool in
                return text.count >= 4
            }).sink(receiveValue: { [weak self] isValid in
                guard let sSelf = self else { return }
                sSelf.viewState.nameTextIsValid = isValid
            }).store(in: &cancellables)
    }
    
    private func addSurnameValidationSubscriber() {
        viewState.$surnameText
            .debounce(for: 0.2, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map({ (text) -> Bool in
                return text.count >= 2
            }).sink(receiveValue: { [weak self] isValid in
                guard let sSelf = self else { return }
                sSelf.viewState.surnameTextIsValid = isValid
            }).store(in: &cancellables)
    }
    
    private func addEmailValidationSubscriber() {
        viewState.$emailText
            .debounce(for: 0.2, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map({ (text) -> Bool in
                return text.count >= 2
            }).sink(receiveValue: { [weak self] isValid in
                guard let sSelf = self else { return }
                sSelf.viewState.emailTextIsValid = isValid
            }).store(in: &cancellables)
    }
    
    private func addDescriptionValidationSubscriber() {
        viewState.$descriptionText
            .debounce(for: 0.2, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map({ (text) -> Bool in
                return text.count >= 4 && text.count > 200
            }).sink(receiveValue: { [weak self] isValid in
                guard let sSelf = self else { return }
                sSelf.viewState.descriptionTextIsValid = isValid
            }).store(in: &cancellables)
    }
    
   private func addButtonSubscriber() {
       viewState.$nameTextIsValid
           .combineLatest(viewState.$surnameTextIsValid, viewState.$emailTextIsValid, viewState.$descriptionTextIsValid)
            .sink {  [weak self] isValidName, isValidSurname, isValidEmail, isValidDescription in
                self?.viewState.nextStepEnabled = isValidName && isValidSurname && isValidEmail && isValidDescription
            }.store(in: &cancellables )
    }
    
}
