//
//  IconTextfieldView.swift
//  Camillion
//
//  Created by Carlos Roig Salvador on 22/3/23.
//  Copyright © 2023 Carlos Roig. All rights reserved.
//

import SwiftUI
import Combine

struct TitleTextfieldView: View {
    
    var title: String
    var hint: String
    var text: Binding<String>
    var limit = 50
    var showError: Bool = false
    var errorText: String = ""

    var body: some View {
        VStack {
            Text(title)
                .topTitleTextFieldModifier()
            TextField(hint, text: text)
                .textFieldBlockModifier()
            if showError {
                Text(errorText)
                    .textFieldErrorTextModifier()
                    .fixedSize(horizontal: false, vertical: true)
                    .opacity(showError ? 1.0 : 0.0)
            }
                       
        }.padding([.bottom,.top], 8)
            .padding([.leading, .trailing], 16)
    }
}

struct TitleTextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextfieldView(title: "Description (optional)", hint:"Title", text: .constant("Este es el texto"))
    }
}


extension View {
    func textFieldErrorTextModifier() -> some View {
        modifier(TextFieldErrorTextModifier())
    }
    
    func textFieldBlockModifier() -> some View {
        modifier(TextFieldBlockModifier())
    }
    
    func topTitleTextFieldModifier() -> some View {
        modifier(TopTitleTextFieldModifier())
    }
}

struct TextFieldBlockModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(8)
            .foregroundColor(Color.theme.secondaryTextColor)
            .font(Font.theme.textfieldFont)
            .background(Color.theme.primaryBackgroundColor)
            .cornerRadius(8)
    }
}

struct TextFieldErrorTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.theme.textfieldFont)
            .foregroundColor(Color.theme.textFieldErrorColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .padding(.top, 8)
            .padding(.trailing, 16)
    }
}

struct TopTitleTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.theme.primaryTextColor)
            .font(Font.theme.topTitleTextFieldFont)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)
            .padding(.leading, 8)
    }
}
