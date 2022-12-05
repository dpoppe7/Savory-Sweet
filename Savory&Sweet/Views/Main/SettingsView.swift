//
//  SettingsView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 11/7/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            Text("Version 1.0 \n\n Created by\n Damaris Poppe and Karen Carballo")
                .padding(60)
                .multilineTextAlignment(.center)
                .navigationTitle("About")

        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
