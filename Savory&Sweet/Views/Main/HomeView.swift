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
    @StateObject private var recipeListVM2 = RandomRecipeListViewModel()
    @State private var searchText = ""
    var refreshButton: UIBarButtonItem!
    @State var isSearch = false;
    
   // var recipes: [RecipeList]
    var body: some View {
        NavigationView{
            VStack{
                //insert text here
                //DisplaySearch
                List(recipeListVM.recipes, id: \.title) { recipe in
                    HStack {
                        
                        AsyncImage(url: recipe.image
                                , content: { image2 in
                           image2.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100)
                            
                         }, placeholder: {
                            ProgressView()
                         })
                            Text(recipe.title)
                            .onTapGesture{
                                NavigationLink(destination: SearchRecipeView(item: recipe.title)){
                                    Text("aqui")
                                }
                            }
//                        
//                    
//                        NavigationLink(destination: SearchRecipeView(recipe: recipe))
                     }
                    //Text(recipe.title)
                }.listStyle(.plain)
                  .searchable(text: $searchText, prompt: "Find a recipe")
                
                  .onChange(of: searchText){ value in
                      Task.init {
                          print(value)
                        if !value.isEmpty &&  value.count > 3 {
                            await recipeListVM.search(name: value)
                            self.isSearch = true
                        } else {
                            recipeListVM.recipes.removeAll()
                            self.isSearch = false
                            //await recipeListVM2.displayRandom()
                        }
                      }
                      
                  }
                  .navigationTitle("Home")
                ZStack{
                    if isSearch == false {
                        VStack{
                            Image("search-icon")
                                .resizable()
                                .scaledToFit()
                            Text("Type an ingredient \n(More than 8 characters)")
                                .multilineTextAlignment(.center)
                                
                        }
                        .position(.init(x: 200, y: 0))
                        .multilineTextAlignment(.center)
                    }
                }
            }
           
            
            
           
        //aqui
            
        }.navigationViewStyle(.stack)
    }

}

extension HomeView{
    var DisplaySearch: some View{
        VStack{
            
            List(recipeListVM.recipes, id: \.title) { recipe in
                HStack {
                    
                    AsyncImage(url: recipe.image
                            , content: { image2 in
                       image2.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                     }, placeholder: {
                        ProgressView()
                     })
                        Text(recipe.title)
                 }
                //Text(recipe.title)
            }
            Button("Hi"){
            Task{

                await recipeListVM2.displayRandom()

            }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeAddViewModel())
    }
}
