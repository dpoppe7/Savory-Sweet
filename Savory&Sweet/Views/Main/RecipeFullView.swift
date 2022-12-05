//
//  RecipeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/2/22.
//

import SwiftUI

struct RecipeFullView: View {
    //@EnvironmentObject var recipeVM: RecipeAddViewModel
    var item: RecipeList

    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: item.image)){
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height:300)
            .background(LinearGradient (gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint:.top, endPoint: .bottom))
            VStack(spacing: 0){
                Text(item.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 0){
                    if !item.description.isEmpty{
                        Text(item.description)
                            .padding(20)
                    }
                    
                    if !item.ingredients.isEmpty{
                        VStack(alignment: .leading, spacing: 0){
                            Text("Ingredients")
                                .font(.headline)
                                //.font(.system(size: 20))
                                .padding(20)
                            Text(item.ingredients)
                                .padding(20)
                        }
                    }
                    
                    if !item.directions.isEmpty{
                        VStack(alignment: .leading, spacing: 0){
                            Text("Directions")
                                .font(.headline)
                                .padding(20)
                            Text(item.directions)
                                .padding(20)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct RecipeFullView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFullView(item: RecipeList.all[0])
    }
}
