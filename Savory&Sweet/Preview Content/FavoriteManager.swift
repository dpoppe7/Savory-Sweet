//
//  FavoriteManager.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/4/22.
//

import SwiftUI



class FavoriteManager: ObservableObject{
    @Published private(set) var recipes: [RecipeList] = []
    init(){
        recipes = RecipeList.all
    }
    func addToFavorite(recipe: RecipeList){
        recipes.append(recipe)
    }
    func removeFromFavorites(recipe: RecipeList){
        recipes = recipes.filter{$0.id != recipe.id}
    }
}
