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
      VStack {
        Text("1")
        Text("4")
        Text("7")
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
    }
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
