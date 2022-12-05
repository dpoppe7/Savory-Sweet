//
//  TabBarView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MyRecipesView()
                .tabItem {
                    Label("My Recipes", systemImage: "list.bullet")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            AddRecipeView()
                .tabItem {
                    Label("New Recipe", systemImage: "plus")
                }
            SettingsView()
                .tabItem {
                    Label("About", systemImage: "questionmark.app")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(RecipeAddViewModel())
    }
}
