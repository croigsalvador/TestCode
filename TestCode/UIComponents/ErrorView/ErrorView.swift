//
//  ErrorView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import SwiftUI

struct ErrorView: View {
    
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            Text(title)
            Divider()
                .padding(8)
            Text(subtitle)
                .multilineTextAlignment(.center)
        }.padding(30)
    }
}

