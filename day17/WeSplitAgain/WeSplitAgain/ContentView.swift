//
//  ContentView.swift
//  WeSplitAgain
//
//  Created by Adam Ahrens on 1/26/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""
  @State private var people = 0
  @State private var tip = 0
  
  private let tips = [0, 5, 10, 15, 20, 25]
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          Text("Enter Bill Amount: $\(checkAmount)")
          TextField("Check Amount", text: $checkAmount)
            .keyboardType(.numbersAndPunctuation)
        }
      }.navigationBarTitle("WeSplitAgain")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
