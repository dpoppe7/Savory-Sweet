//
//  TestView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/5/22.
//

import SwiftUI

struct TestView: View {
 //let name: String
 
 var item: String
 @StateObject private var recipeInfoVM = RecipeDisplayViewModel()
 //var recipeP = RecipeParams()
 
  var body: some View {
   var title: String = ""
   ScrollView {
    //Text("All recipes: \(item)")
    //}
    //   VStack {
    //     await recipeInfoVM.recipeDisplay(id: 5)
    //   }
    // //      ScrollView{
    // //         //Text("All recipes: \(item)")
    // //        recipeParams = await recipeInfoVM.recipeDisplay(id: 5)
    // //
    // //         //0Text()
    // //      }
    //   }
    
 
     HStack {
      //Text("All recipes: \(item)")
      Button("hi"){
       
      }
      
      //.searchable(text: $searchText, prompt: "Find a recipe")
       .onAppear(){
        
        Task.init {
         // print(value)
         
         let x = await recipeInfoVM.recipeDisplay(id: Int(item) ?? 0)
         
         //            Text(x.title?.description ?? "")
         //            Spacer()
         //            Text(x.title ?? "")
        title = x.title ?? ""
         //      url = x.sourceUrl?.description ?? ""
         //Text("algo maaaas" + (x.title ?? "xd"))
         print(x.title ?? "")
        
        }
       }
      Text("algo mas" + title.description)
     }
     
   }
 }
}
 

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(item: "")
        .environmentObject(RecipeDisplayViewModel())
    }
}
