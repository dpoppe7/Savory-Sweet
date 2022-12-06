//
//  WebService.swift
//  Savory&Sweet
//
//  Created by Damaris Poppe on 11/12/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

class Webservice {
    //static let apiKey = "a1ab8e06858a449580e39c0500ba9951"
    // a67a5241c34f45429f75c2d8a1858a67    
    
    func getRecipes(searchTerm: String) async throws -> [Recipe] {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spoonacular.com"
        components.path = "/recipes/complexSearch"
        components.queryItems = [
//                    URLQueryItem(name: "query", value: searchTerm.trimmed()),
                    URLQueryItem(name: "number", value: "8"),
                    URLQueryItem(name: "query", value: searchTerm),
                    URLQueryItem(name: "apiKey", value: "a1ab8e06858a449580e39c0500ba9951")
                    
                ]
        //components.queryItems = [URLQueryItem]()
        //components.queryItems?.append(URLQueryItem(name: "apikey", value: "a1ab8e06858a449580e39c0500ba9951"))
        //components.queryItems?.append(URLQueryItem(name: "number", value: "8"))
        
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let recipeResponse = try? JSONDecoder().decode(RecipeResponse.self, from: data)
        return recipeResponse?.results ?? []
    }
    
 private class func configureRecipe(recipeInfo: [String: Any]) -> RecipeParams{
     var recipe = RecipeParams()
     
     if let title = recipeInfo["title"] as? String {
         recipe.title = title
     }
     
     if let sourceURL = recipeInfo["sourceUrl"] as? String {
         recipe.sourceUrl = sourceURL
     }

     return recipe
 }
    func getRecipeInfo(id: Int) async throws -> RecipeParams {
       // var recipeParams = RecipeParams()
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spoonacular.com"
        components.path = "/recipes/\(id)/information"
        components.queryItems = [
//                    URLQueryItem(name: "query", value: searchTerm.trimmed()),
                    URLQueryItem(name: "apiKey", value: "a67a5241c34f45429f75c2d8a1858a67")]


        guard let url = components.url else {
            throw NetworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }

        //let recipeResponse = try? JSONDecoder().decode(RecipeInfo.self, from: data)
     
        let responseObject = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        let recipe = Webservice.configureRecipe(recipeInfo: responseObject as! [String : Any])
         //completion(recipe, true, nil)
         return recipe

        
//        let recipe = configureRecipe(recipeInfo: recipeResponse)
//        recipeParams.title = recipeResponse?.title
//        recipeParams.sourceUrl = recipeResponse?.sourceUrl
    
    }
    
    func getRandomRecipes() async throws -> [Recipe] {
     
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spoonacular.com"
        components.path = "/recipes/random"
        components.queryItems = [
//                    URLQueryItem(name: "query", value: searchTerm.trimmed()),
                    URLQueryItem(name: "number", value: "8"),
                    URLQueryItem(name: "apiKey", value: "a67a5241c34f45429f75c2d8a1858a67")
                ]
       
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let recipeResponse = try? JSONDecoder().decode(RecipeResponse.self, from: data)
        return recipeResponse?.results ?? []
    }
}
