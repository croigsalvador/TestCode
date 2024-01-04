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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TripsListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListView(viewModel: DeveloperInstances.shared.tripListViewModel)
    }
}
