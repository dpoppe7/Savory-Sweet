//
//  Recipe.swift
//  Savory&Sweet
//
//  Created by Damaris Poppe on 11/12/22.
//

import Foundation

struct RecipeResponse: Decodable {
    let offset: Int
    let number: Int
    let totalResults: Int
    let results: [Recipe]  
}

struct Recipe: Decodable {
    let id: Int
    let title: String
    let image: String
    let imageType: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case imageType = "imageType"
    }
}

struct RandomRecipeResponse: Decodable {
    let recipes: [RandomRecipe]
}

struct RandomRecipe: Decodable {
    let id: Int
    let title: String
    let image: String
    let imageType: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case imageType = "imageType"
    }
}
