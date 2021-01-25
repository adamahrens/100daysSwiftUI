//
//  ContentView.swift
//  WeSplit
//
//  Created by Adam Ahrens on 1/25/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State private var tip = Tips.zero
  @State private var billAmount = ""
  @State private var people = 0
  
  private var formattedBill: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    
    guard
      let num = Double(billAmount),
      let formatted = formatter.string(from: NSNumber(value: num))
    else { return "$0.0"}
    
    return formatted
  }

    var body: some View {
      NavigationView {
        Form {
          Section {
            Text("A group bill splitting application")
          }
          
          Section {
            Text("Each Person Owes $0.0")
          }
          
          Section {
            Text("Bill Total \(formattedBill)")
            TextField("Enter total amount", text: $billAmount)
              .keyboardType(.numbersAndPunctuation)
          }
          Section {
            Text("Choose Tip \(tip.rawValue)")
            
            VStack(spacing: 20) {
              Picker(selection: $tip, label: Text("Select a Tip")) {
                ForEach(Tips.allCases, id: \.self) { tip in
                  Text("\(tip.rawValue)")
                }
              }.pickerStyle(SegmentedPickerStyle())
            }
            .padding()
          }
          
          Section {
            Text("How Many In your Party")
            Text("\(people)")
            Button("Add Person") {
              self.people += 1
            }
          }
        }.navigationBarTitle(Text("WeSplit"))
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
