//
//  TitleTextView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import SwiftUI

struct TitleTextView: View {
    
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
            TextEditor(text: text)
                .frame(minHeight: 100)
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

struct TitleViewfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextfieldView(title: "Description (optional)", hint:"Title", text: .constant("Este es el texto"))
    }
}


