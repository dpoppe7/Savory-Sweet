//
//  CategoriesView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView{
            Text("Categories")
                .navigationTitle("Categories")

        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
