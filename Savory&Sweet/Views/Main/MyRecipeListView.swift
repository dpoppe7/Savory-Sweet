//
//  MyRecipeListView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/2/22.
//

import SwiftUI

struct MyRecipeListView: View {
    //@EnvironmentObject var favoritesAdd: RecipeAddViewModel
    @StateObject var favoritesAdd = RecipeAddViewModel()

    var recipes: [RecipeList]
    var body: some View {
        VStack{
            HStack{
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15){
                ForEach(recipes){
                    recipe in
                    NavigationLink(destination: RecipeFullView(item: recipe)){
                        RecipeItem(item: recipe)
                            .environmentObject(favoritesAdd)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct MyRecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            MyRecipeListView(recipes: RecipeList.all)
                
        }
    }
}
