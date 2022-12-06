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

    @Published var recipes: [RecipeInfoViewModel] = []

      func recipeDisplay(id: Int) async -> RecipeParams{
        var recipes2 = RecipeParams()
       do {
        recipes2 = try await Webservice().getRecipeInfo(id: id)
        //let recipe = configureRecipe(recipeInfo: responseObject)
        //self.recipes = recipes
        
       } catch {
        print(error)
       }
       print(recipes2)
       return recipes2
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

struct RecipeInfoViewModel{

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
