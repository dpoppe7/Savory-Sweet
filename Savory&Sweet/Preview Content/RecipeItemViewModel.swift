//
//  RecipeItemViewModel.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/2/22.
//

import Foundation

struct RecipeList: Identifiable{
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let url : String
    
}

extension RecipeList{
    static let all: [RecipeList] = [
        RecipeList(
            name: "Tres leches",
            image: "https://media.istockphoto.com/id/1222365439/photo/tres-leches-cake-typical-latin-american-dessert-is-made-of-condensed-milk-evaporated-milk-and.jpg?s=612x612&w=is&k=20&c=yPb-1_SJBkWpnsuhGr-H8uTJtAY-qD2ICSBxu2axKQ4=",
            description: "tres lechesss",
            ingredients: "milk, flour",
            directions: "cook",
            url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Ftres-leches-cake&psig=AOvVaw1hs2kdO49RvkN_8j20ZgeY&ust=1670121275164000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCNC9kNy03PsCFQAAAAAdAAAAABAE")
    ]
}
