//
//  HomeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            Text("Home.")
                .navigationTitle("Home")

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
