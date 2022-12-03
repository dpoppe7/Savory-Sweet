//
//  RecipeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/2/22.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var recipeVM: RecipeAddViewModel
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
            VStack(spacing: 30){
                Text(item.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 30){
                    if !item.description.isEmpty{
                        Text(item.description)
                    }
                    
                    if !item.ingredients.isEmpty{
                        VStack(alignment: .leading, spacing: 20){
                            Text("Ingredients")
                                .font(.headline)
                            Text(item.ingredients)
                        }
                    }
                    
                    if !item.directions.isEmpty{
                        VStack(alignment: .leading, spacing: 20){
                            Text("Directions")
                                .font(.headline)
                            Text(item.directions)
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

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(item: RecipeList.all[0])
    }
}
