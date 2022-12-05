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
    let datePublished: String
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
            datePublished: "2022-10-08",
            url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Ftres-leches-cake&psig=AOvVaw1hs2kdO49RvkN_8j20ZgeY&ust=1670121275164000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCNC9kNy03PsCFQAAAAAdAAAAABAE"),
        RecipeList(
            name: "Chocolate cake",
            image: "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcSWOjtRJTyt3iHScdM_UazRNQuzKtRH9Fsmn0aHKqGmqhd4mSy4J8CBfqv3BzerJY59",
            description: "tres lechesss",
            ingredients: "milk, flour",
            directions: "cook",
            datePublished: "2022-10-08",
            url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Ftres-leches-cake&psig=AOvVaw1hs2kdO49RvkN_8j20ZgeY&ust=1670121275164000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCNC9kNy03PsCFQAAAAAdAAAAABAE")
        ,
    RecipeList(
        name: "Strawberry cake",
        image: "https://preppykitchen.com/wp-content/uploads/2022/05/Strawberry-Cake-Recipe-Card.jpg",
        description: "tres lechesss",
        ingredients: "milk, flour",
        directions: "cook",
        datePublished: "2022-10-08",
        url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Ftres-leches-cake&psig=AOvVaw1hs2kdO49RvkN_8j20ZgeY&ust=1670121275164000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCNC9kNy03PsCFQAAAAAdAAAAABAE")
    ]
}
