//
//  TripsListView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import SwiftUI

struct TripListView: View {
    
    @ObservedObject var viewModel: TripListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                MapView(mapState: viewModel.mapState)
                    .frame(height: 400)
                Spacer()
                GeometryReader { reader in
                    ScrollView {
                        ScrollViewReader { scrollReader in
                            TripListFactoryView(viewModel: viewModel)
                        }
                    }
                }
            }.navigationBarItems(trailing: Button(action:viewModel.add) {
                Image(systemName: "plus")
                    .tint(Color.black)
            }).navigationBarTitle("Trips", displayMode: .inline)
                .onAppear(perform: viewModel.onAppear)
        }
    }
}

struct TripsListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListView(viewModel: DeveloperInstances.shared.tripListViewModel)
    }
}
