//
//  TripListFactoryView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import SwiftUI

struct TripListFactoryView: View {
    
    @ObservedObject var viewModel: TripListViewModel
    let columns = [GridItem(.flexible(minimum:16.0))]
    
    var body: some View {
        switch viewModel.listState {
        case .idle:
            CustomProgressView()
        case .empty:
            ErrorView(title: "There aren't trips", subtitle: "")
        case .error:
            ErrorView(title: "Something has failed", subtitle: "There was an error")
        case .loading:
            CustomProgressView()
        case .loaded(let elements):
            LazyVGrid(columns: columns) {
                ForEach(elements) { model in
                    TripElementView(uiModel: model)
                        .onTapGesture {
                            viewModel.userDidSelect(uiModel: model)
                        }
                }
            }.padding()
        }
    }
}

struct TripListFactoryView_Previews: PreviewProvider {
    static var previews: some View {
        TripListFactoryView(viewModel: DeveloperInstances.shared.tripListViewModel)
    }
}
