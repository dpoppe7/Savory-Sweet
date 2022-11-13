//
//  RecipeModel.swift
//  Savory&Sweet
//
//  Created by Damaris Poppe on 11/12/22.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipes: [RecipeViewModel] = []
    
    func search(name: String) async {
        do {
            let recipes = try await Webservice().getRecipes(searchTerm: name)
            self.recipes = recipes.map(RecipeViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
}


struct RecipeViewModel{

    let recipe: Recipe
    
    var id: Int {
        recipe.id
    }
    
    var title: String {
        recipe.title
    }
    
    var image: URL? {
        URL(string: recipe.image)
    }
    
    var imageType: String {
        recipe.imageType
    }
}


