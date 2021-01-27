//
//  ContentView.swift
//  Measurement
//
//  Created by Adam Ahrens on 1/27/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  @State private var input = ""
  @State private var base = 0
  @State private var conversion = 0
  
  private var output : String {
    guard
      let input = Double(self.input)
    else { return "" }
    
    let base = measurements[self.base]
    let convertTo = measurements[self.conversion]
    let result = Measurement(value: input, unit: base).converted(to: convertTo)
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: result.value)) ?? ""
  }
  
  private let measurements = [UnitLength.feet, UnitLength.yards, UnitLength.centimeters, UnitLength.inches, UnitLength.kilometers, UnitLength.millimeters, UnitLength.miles]
  
  var body: some View {
    Form {
      
      Section(header: Text("From")) {
        TextField("", text: $input)
          .keyboardType(.decimalPad)
        
        Picker("From", selection: $base) {
          ForEach(0..<measurements.count) {
            Text("\(self.measurements[$0].display())")
          }
        }.pickerStyle(SegmentedPickerStyle())
      }
      
      Section(header: Text("To")) {
        Picker("From", selection: $conversion) {
          ForEach(0..<measurements.count) {
            Text("\(self.measurements[$0].display())")
          }
        }.pickerStyle(SegmentedPickerStyle())
        Text("\(output)")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
