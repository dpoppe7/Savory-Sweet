//
//  FavoritesView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesAdd: RecipeAddViewModel
    var columns = [GridItem(.adaptive(minimum:130), spacing: 13)]
    var body: some View {
        NavigationView{
            ScrollView{
                if favoritesAdd.recipes.count >= -1{
                    LazyVGrid(columns: columns){
                        ForEach(favoritesAdd.recipes, id: \.id){
                            recipe in RecipeFavoriteCard(item: recipe)
                            
                        }
                    }
                }
                else{
                    Text("No favorite recipes yet.")
                    // .padding()
                }
            }
            .navigationTitle("Favorites")
        }
        .padding(.top)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(RecipeAddViewModel())
    }
}
