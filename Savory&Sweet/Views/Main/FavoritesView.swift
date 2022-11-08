//
//  FavoritesView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView{
            Text("No favorite recipes yet.")
                .padding()
                .navigationTitle("Favorites")

        }
        .navigationViewStyle(.stack)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
