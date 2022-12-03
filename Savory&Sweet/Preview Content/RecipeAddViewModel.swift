//
//  RecipeAddViewModel.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/2/22.
//

import SwiftUI

class RecipeAddViewModel: ObservableObject{
    @Published private(set) var recipes: [RecipeList] = []
    
    init(){
        recipes = RecipeList.all
    }
    func addRecipe(recipe: RecipeList){
        recipes.append(recipe)
    }
}
