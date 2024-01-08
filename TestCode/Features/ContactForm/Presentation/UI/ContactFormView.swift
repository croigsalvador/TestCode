//
//  ContactFormView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import SwiftUI

struct ContactFormView: View {
    
    @ObservedObject var viewModel: ContactFormViewModel
    @ObservedObject var viewState: ContactFormViewState
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                GeometryReader { reader in
                    ScrollView {
                        TitleTextfieldView(title: "Name", hint: "Type your name", text: $viewState.nameText)
                        TitleTextfieldView(title: "Surname", hint: "Type your surname", text: $viewState.surnameText)
                        TitleTextfieldView(title: "Email", hint: "Type your email", text: $viewState.emailText, keyBoardType: .emailAddress)
                        TitleTextfieldView(title: "Phone", hint: "Type your phone", text: $viewState.phoneText, keyBoardType: .decimalPad)
                        TitleTextView(title: "Description", hint: "Explain the issue", text: $viewState.descriptionText)
                    }.padding(.bottom, keyboardHeight)
                        .onChange(of: viewState.hideKeyBoard) { shouldHideKeyboard in
                            if shouldHideKeyboard {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }
                        }
                }
                Spacer()
                CTAButtonView(type: viewState.nextStepEnabled ? .green : .disabled, text: "Send", image: Image(systemName: "arrow.right"), action: {
                    viewModel.send()
                }).endEditingKeyboardOnDragGesture()
                
            } .navigationBarItems(leading:Button(action:viewModel.back) {
                Image(systemName: "chevron.backward")
                    .tint(Color.black)
            }).navigationBarTitle("Report issue", displayMode: .inline)
        }
    }
}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView(viewModel: DeveloperInstances.shared.contactFormViewModel, viewState: DeveloperInstances.shared.contactFormViewModel.viewState)
    }
}

