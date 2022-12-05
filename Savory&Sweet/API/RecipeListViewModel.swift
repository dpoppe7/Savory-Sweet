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

@MainActor
class RecipeDisplayViewModel: ObservableObject {
    
    @Published var recipes: [RecipeURLViewModel] = []
    
    func recipeDisplay(id: Int) async {
        do {
            //let recipes = try await Webservice().getRecipeInfo(id: id)
           // self.recipes = recipes.map(RecipeURLViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
}

@MainActor
class RandomRecipeListViewModel: ObservableObject {
    
    @Published var recipes: [RandomRecipeViewModel] = []
    func displayRandom() async {
        do {
           // let recipes = try await Webservice().getRandomRecipes()
            //self.recipes = recipes.map(RandomRecipeViewModel.init)
            
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

struct RandomRecipeViewModel{

    let recipeVar: RandomRecipe
    
    var id: Int {
        recipeVar.id
    }
    
    var title: String {
        recipeVar.title
    }
    
    var image: URL? {
        URL(string: recipeVar.image)
    }
    
    var imageType: String {
        recipeVar.imageType
    }
}

struct RecipeURLViewModel{

    let recipe: RecipeInfo
    
    var id: Int {
        recipe.id
    }
    
    var sourceUrl: String {
        recipe.sourceUrl
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
