//
//  AddRecipeView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct AddRecipeView: View {
    var body: some View {
        NavigationView{
            Text("New Recipe")
                .navigationTitle("New Recipe")

        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
