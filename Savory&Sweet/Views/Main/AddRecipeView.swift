//
//  AddRecipeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeVM: RecipeAddViewModel
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    
    //@State private var
    @State private var openRecipe = false
//    @StateObject private var recipeAddListVM = RecipeAddViewModel()

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Name")){
                    TextField("Recipe Name: " , text: $name)
                }
                Section(header: Text("Description")){
                    TextEditor(text: $description)
                }
                Section(header: Text("Ingredients")){
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Directions")){
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content:  {
//                ToolbarItem(placement: .navigationBarLeading){
//                    Button{
//                        dismiss()
//                    }label:{
//                        Label("Cancel", systemImage: "xmark").labelStyle(.iconOnly)
//                    }
//                }
                ToolbarItem{
                    NavigationLink(isActive: $openRecipe){
                        RecipeView(item: recipeVM.recipes.sorted{ $0.datePublished > $1.datePublished}[0])
                            //.navigationBarBackButtonHidden(true)
                    }label:{
                        Button{
                            saveRecipe()
                            openRecipe = true
                              }
                        label:{
                            Label("Done", systemImage: "checkmark").labelStyle(.iconOnly)
                        }
                    }.disabled(name.isEmpty)
                }
            })
            .navigationTitle("Add New Recipe")
        .navigationViewStyle(.stack)
    }
}
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
        .environmentObject(RecipeAddViewModel())
        
    }
}
extension AddRecipeView{
    private func saveRecipe(){
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let datePublished = dateFormatter.string(from: now)
        print(datePublished)
        let recipe = RecipeList(name: name, image: "", description: description, ingredients: ingredients, directions: directions, datePublished: datePublished, url: "")
        recipeVM.addRecipe(recipe: recipe)
        
    }
}
