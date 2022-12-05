//
//  SearchRecipeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/4/22.
//

import SwiftUI

struct SearchRecipeView: View {
    @StateObject private var recipeListVM = RecipeListViewModel()
    var item: String

    var body: some View {
        Text(item)
     
    }
}

struct SearchRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeView(item: "String")
           // .environmentObject(RecipeListViewModel())
    }
}
