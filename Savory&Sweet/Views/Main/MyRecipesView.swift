//
//  CategoriesView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct MyRecipesView: View {
    var body: some View {
        NavigationView{
            //Text("My Recipes")
            MyRecipeListView(recipes: RecipeList.all)
                .navigationTitle("My Recipes")
                
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView()
    }
}
