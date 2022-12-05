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
 //let apilink = item[1]
 var body: some View {
  
  let input = "Swift Tutorials"
  let char = input[input.index(input.startIndex, offsetBy: 3)]
  ScrollView{
   Text("All recipes: \(item)")
    //Text(\char)
     //.font(.largeTitle)
   }
 }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(item: "")
    }
}
