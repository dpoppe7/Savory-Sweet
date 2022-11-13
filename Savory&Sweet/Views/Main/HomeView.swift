//
//  HomeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView{
            //Text("Home")
                //.navigationTitle("Home2")
            Text("Searching for \(searchText)")
                            .searchable(text: $searchText, prompt: "Find a recipe")
                            .navigationTitle("Home")

        }
        .navigationViewStyle(.stack)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
    
}

