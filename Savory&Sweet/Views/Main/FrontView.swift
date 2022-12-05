//
//  FrontView.swift
//  Savory&Sweet
//
//  Created by Karen Carballo on 12/5/22.
//

import SwiftUI

struct FrontView: View {
    @State var isActive : Bool = false
       @State private var size = 0.8
       @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
                  ContentView()
              } else {
                  VStack {
                      VStack {
                          Image("savory")
                              .font(.system(size: 80))
                              .foregroundColor(.red)
                          Text("Savory&Sweet")
                              .font(Font.custom("Baskerville-Bold", size: 36))
                              .foregroundColor(.white)
                              
                              //.foregroundColor(.black.opacity(0.80)
                      }
                      .scaleEffect(size)
                      .opacity(opacity)
                      .onAppear {
                          withAnimation(.easeIn(duration: 1.2)) {
                              self.size = 0.9
                              self.opacity = 1.00
                          }
                      }
                  }
                  .onAppear {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                          withAnimation {
                              self.isActive = true
                          }
                      }
                  }
                  .background(
                          Image("savory2")
                            .opacity(0.8)
                            .scaledToFit()
                           
                            
                            //.scaledToFit()
                            //.ignoresSafeArea()
                            //.resizable()
                      )
                 
              }
        
          }
}

struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        FrontView()
    }
}
