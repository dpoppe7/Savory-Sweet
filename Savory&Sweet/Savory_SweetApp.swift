//
//  Savory_SweetApp.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI
@main
struct Savory_SweetApp: App {
    
    @StateObject var recipesAddVM = RecipeAddViewModel()

    var body: some Scene {
        WindowGroup {
            FrontView()
                .environmentObject(recipesAddVM)
        }
    }
}


