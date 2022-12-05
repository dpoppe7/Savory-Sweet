//
//  RecipeAddViewModel.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/2/22.
//

import SwiftUI
struct Favorites: Identifiable{
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let datePublished: String
    let url : String
    
}

extension Favorites{
    static let list: [Favorites] = []
}

class RecipeAddViewModel: ObservableObject{
    @Published private(set) var recipes: [RecipeList] = []
    @Published private(set) var favoriteRecipes: [Favorites] = []
    
    init(){
        recipes = RecipeList.all
    }
    func addRecipe(recipe: RecipeList){
        recipes.append(recipe)
    }
    
    func removeFromFavorites(recipe: RecipeList){
        recipes = recipes.filter{$0.id != recipe.id}
    }
    
    func addToFavorite(recipe: Favorites){
        favoriteRecipes.append(recipe)
    }
    
}
