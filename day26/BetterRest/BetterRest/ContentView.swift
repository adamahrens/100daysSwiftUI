//
//  ContentView.swift
//  BetterRest
//
//  Created by Adam Ahrens on 2/18/21.
//

import SwiftUI
import CoreML

struct ContentView: View {
  
  @State private var sleepAmount = 8.0
  @State private var wakeUpDate = defaultWakeupTime
  @State private var coffeeAmount = 1
  
  @State private var alertTitle = ""
  @State private var alertMessage = ""
  @State private var showingAlert = false
  
  private var dateRange: ClosedRange<Date> {
    let now = Date()
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: now)!
    return now...tomorrow
  }
  
  private var openDateRange:  PartialRangeFrom<Date> {
    return Date()...
  }
  
  static var defaultWakeupTime: Date {
    let components = DateComponents(hour: 7, minute: 0)
    return Calendar.current.date(from: components) ?? Date()
  }
  
  private var formattedCoffee: String {
    return coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups"
  }
  
  private func calculateBedtime() {
    let model = try! SleepCalculator(configuration: MLModelConfiguration())
    let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpDate)
    
    // Convert to seconds
    let hour = (components.hour ?? 0) * 60 * 60
    let minute = (components.minute ?? 0) * 60
    let wake = Double(hour + minute)
    // Feed to CoreML
    do {
      let prediction = try model.prediction(wake: wake, estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
      
      // Convert time in seconds to subtract from a Date
      let sleepTime = wakeUpDate - prediction.actualSleep
      
      // Format bedtime
      let formatter = DateFormatter()
      formatter.timeStyle = .medium
      
      alertTitle = "Success"
      alertMessage = "Ideal bedtime is \(formatter.string(from: sleepTime))"
    } catch {
      alertTitle = "Error"
      alertMessage = "An error occurred while determing bedtime"
    }
    
    showingAlert = true
  }
  
  var body: some View {
    NavigationView() {
      Form {
        Section(header: Text("How much sleep?")) {
          Stepper(value: $sleepAmount, in: 4.0...12.0, step: 0.25) {
            Text("\(sleepAmount, specifier: "%g") hours")
          }
        }
        
        Section(header: Text("When do you want to wake up?")) {
          DatePicker("Select date", selection: $wakeUpDate, displayedComponents: .hourAndMinute).labelsHidden().datePickerStyle(WheelDatePickerStyle())
        }
        
        Section(header: Text("How many cups of coffee?")) {
          Stepper(value: $coffeeAmount, in: 1...10, step: 1) {
            Text(formattedCoffee)
          }
        }
      }
      .navigationTitle(Text("BetterRest"))
      .navigationBarItems(trailing:
        Button(action: calculateBedtime) {
            Text("Calculate Bedtime")
        }
      )
      .alert(isPresented: $showingAlert, content: {
        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
      })
//    Dont need a closure -> Void to call another closure -> Boid
//      .navigationBarItems(trailing: Button("Calculate Bedtime") {
//            calculateBedtime()
//      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
