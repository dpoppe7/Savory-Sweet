//
//  RecipeFavoriteCard.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/4/22.
//

import SwiftUI

struct RecipeFavoriteCard: View {
    @EnvironmentObject var favoritesAdd: RecipeAddViewModel
    var item: RecipeList
    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing){
                VStack{
                    AsyncImage(url: URL(string: item.image)){
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay(alignment: .bottom){
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius:5, x: 0, y: 0)
                                    .frame(maxWidth: 150)
                                    .padding()
                            }
                    } placeholder: {
                       
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .overlay(alignment: .bottom){
                                
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius:5, x: 0, y: 0)
                                    .frame(maxWidth: 150)
                                    .padding()
                            }
                    }
                }.frame(width: 160, height: 217, alignment: .top)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),startPoint: .top, endPoint: .bottom ))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color:Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
                Button{
                    favoritesAdd.removeFromFavorites(recipe: item)
                }label:{
                    Image(systemName: "heart.fill")
                        .padding(8)
                        .foregroundColor(.red)
                        .background(.white)
                        .cornerRadius(50)
                        .padding(10)
                }
             }
            }
    }
}

struct RecipeFavoriteCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFavoriteCard(item: RecipeList.all[0])
            .environmentObject(RecipeAddViewModel())
    }
}
