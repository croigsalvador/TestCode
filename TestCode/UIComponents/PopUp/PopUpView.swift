//
//  PopUpView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import SwiftUI

struct PopUpView<Content:View>: View {
    
    let content: Content
    let title: String
    @State private var dragAmount = CGSize.zero

    
    @Binding var showingView: Bool
    
    var body: some View {
        VStack {
            Spacer()
            if showingView {
                withAnimation {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Spacer()
                            Text(title)
                                .titleModifier()
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showingView = false
                                }
                            }, label: {
                                Image(systemName: "xmark")
                                    .tint(Color.black)
                            })
                            .padding()
                        }
                        content
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 10)
                .offset(y: dragAmount.height)
                .transition(.move(edge: .bottom))
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount = $0.translation }
                        .onEnded { value in
                            if value.translation.height > 50 {
                                withAnimation {
                                    self.showingView = false
                                }
                            }
                            self.dragAmount = .zero
                        }
                )
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct PopUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        PopUpView(showingView: .constant(true),stopInfo:DeveloperInstances.shared.stopInfoApiModel.toDomainModel()!)
//    }
//}
