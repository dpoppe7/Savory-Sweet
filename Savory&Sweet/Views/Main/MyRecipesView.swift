//
//  CategoriesView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct MyRecipesView: View {
    @EnvironmentObject var recipeVM: RecipeAddViewModel
    
    var body: some View {
        NavigationView{
            //Text("My Recipes")
            ScrollView{
                MyRecipeListView(recipes: recipeVM.recipes)
                    .navigationTitle("My Recipes")
            }
           
                
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView()
            .environmentObject(RecipeAddViewModel())
    }
}
