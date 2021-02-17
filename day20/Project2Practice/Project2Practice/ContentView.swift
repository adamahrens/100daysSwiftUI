//
//  ContentView.swift
//  Project2Practice
//
//  Created by Adam Ahrens on 1/28/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    // Build a Grid
    HStack(alignment: .center, spacing: 20) {
//      Color.purple.frame(width: 200, height: 200, alignment: .center)
      Color.purple.edgesIgnoringSafeArea(.all)
      VStack {
        Text("1")
        Text("4")
        Text("7")
        
      }
      
      // RadialGradient
      // AngularGradient
      LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .top, endPoint: .bottom)
      
      Button("Tap Me") {
        // Action
      }
      
      Button(action: {
        // Action
      }) {
        Image("USA").renderingMode(.original)
      }
      VStack {
        Text("2")
        Text("5")
        Text("8")
      }
      VStack {
        Text("3")
        Text("6")
        Text("9")
      }
      
      ZStack {
        Text("Hello")
      }.background(Color.red)
    }.background(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .purple, .red]), center: .center))
  }
}

/*
 var body: some View {
 VStack {
 VStack(alignment: .center, spacing: 12.0) {
 Text("Top VStack")
 Text("Bottom VStack")
 }
 
 Spacer()
 
 HStack(alignment: .top, spacing: 12.0) {
 Text("Left HStack")
 Text("Right HStack")
 }
 
 Spacer()
 
 ZStack {
 Text("Behind ZStack")
 Text("Front ZStack")
 }
 }
 }
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
