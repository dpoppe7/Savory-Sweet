//
//  HomeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct HomeView: View {
    //@State private var searchText = ""
    @StateObject private var recipeListVM = RecipeListViewModel()
    @State private var searchText = ""
    
    
//    var body: some View {
//        NavigationView{
//            Text("Searching for \(searchText)")
//                            .searchable(text: $searchText, prompt: "Find a recipe")
//                            .navigationTitle("Home")
//
//
//        }
//        .navigationViewStyle(.stack)
//    }
    var body: some View {
        NavigationView{
            List(recipeListVM.recipes, id: \.title) { recipe in
                Text(recipe.title)
            }.listStyle(.plain)
              .searchable(text: $searchText)
              .onChange(of: searchText){ value in
                  Task.init {
                      print(value)
                    if !value.isEmpty &&  value.count > 8 {
                        await recipeListVM.search(name: value)
                    } else {
                        recipeListVM.recipes.removeAll()
                    }
                  }
              }
              .navigationTitle("Home")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
    
}
