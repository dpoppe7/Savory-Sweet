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
    private var isNotSearch = true;
       
    
    var body: some View {
        
        NavigationView{
            VStack{
                //insert text here
                
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
                }.listStyle(.plain)
                  .searchable(text: $searchText, prompt: "Find a recipe")
                
                  .onChange(of: searchText){ value in
                      Task.init {
                          print(value)
                        if !value.isEmpty &&  value.count > 4 {
                            await recipeListVM.search(name: value)
                        } else {
                            recipeListVM.recipes.removeAll()
                            await recipeListVM2.displayRandom()
                        }
                      }
                      
                  }
                  .navigationTitle("Home")
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
