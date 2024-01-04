//
//  TagView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import SwiftUI

struct TagView: View {
    var tag: Tag
    
    var body: some View {
        Text(tag.text)
            .padding([.horizontal], 8)
            .padding([.vertical], 4)
            .foregroundColor(tag.textColor)
            .background(tag.backgroundColor)
            .cornerRadius(8)
            .font(Font.defaultMediumFontWithSize(size: 13.0))
            .frame(height: 24)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: TripStatus.ongoing)
    }
}
