//
//  RecipeItem.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/2/22.
//

import SwiftUI

struct RecipeItem: View {
    var item: RecipeList
    var body: some View {
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
            }
        }.frame(width: 160, height: 217, alignment: .top)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),startPoint: .top, endPoint: .bottom ))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color:Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItem(item: RecipeList.all[0])
    }
}
