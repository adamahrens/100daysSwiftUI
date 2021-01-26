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
  @State private var people = ""
  @State private var tip = 0
  
  private var totalPerPerson: String {
    guard
      let checkTotal = Double(checkAmount),
      let peeps = Int(people),
      peeps > 0
    else { return "N/A"}
    
    let perPerson = (checkTotal + tipAmount) / Double(peeps)
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: perPerson)) ?? "N/A"
  }
  
  private var tipAmount: Double {
    guard
      let checkTotal = Double(checkAmount)
    else { return 0.0 }
    
    return (Double(tip) / 100.0) * checkTotal
  }
  
  private var checkAmountFormatted: String {
    guard
      let checkTotal = Double(checkAmount)
    else { return ""}
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: checkTotal)) ?? ""
  }
  
  private var totalAmount: String {
    guard
      let checkTotal = Double(checkAmount)
    else { return "" }
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return "\(formatter.string(from: NSNumber(value: checkTotal))!) + Tip \(formatter.string(from: NSNumber(value: tipAmount))!)"
  }
  
  private let tips = [0, 5, 10, 15, 20, 25, 35]
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Total Bill")) {
          Text(totalAmount)
        }
        
        Section {
          Text("Enter Bill Amount: \(checkAmountFormatted)")
          TextField("Check Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
        }
        
        Section(header: Text("Select Tip Percentage")) {
          Picker("Tip Percentage", selection: $tip) {
            ForEach(0..<tips.count) {
              Text("\(self.tips[$0]) %")
            }
          }.pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Number of People")) {
          TextField("People", text: $people)
            .keyboardType(.numberPad)
        }
        
        Section(header: Text("Total Amount $/person")) {
          Text(totalPerPerson)
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
