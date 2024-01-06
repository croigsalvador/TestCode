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
                        RoundedRectangle(cornerRadius: 2)
                            .frame(width: 60, height: 4)
                            .padding([.bottom], 20)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        content.frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 20)
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
