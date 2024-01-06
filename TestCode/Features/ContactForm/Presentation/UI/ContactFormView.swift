//
//  ContactFormView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import SwiftUI

struct ContactFormView: View {
    
    @ObservedObject var viewModel: ContactFormViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader { reader in
                ScrollView {
                    TitleTextfieldView(title: "Name", hint: "Type your name", text: $viewModel.viewState.nameText)
                    TitleTextfieldView(title: "Surname", hint: "Type your surname", text: $viewModel.viewState.surnameText)
                    TitleTextfieldView(title: "Email", hint: "Type your email", text: $viewModel.viewState.emailText)
                    TitleTextfieldView(title: "Phone", hint: "Type your phone", text: $viewModel.viewState.emailText)
                    TitleTextView(title: "Description", hint: "Explain the issue", text: $viewModel.viewState.descriptionText)
                    }
            }
            Spacer()
            CTAButtonView(type: viewModel.viewState.nextStepEnabled ? .green : .disabled, text: "Send", image: Image(systemName: "arrow.right"), action: {
            
            })
        }.ignoresSafeArea(.keyboard)
    }
}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView(viewModel: DeveloperInstances.shared.contactFormViewModel)
    }
}
