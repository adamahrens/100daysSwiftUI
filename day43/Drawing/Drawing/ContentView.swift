//
//  ContentView.swift
//  Drawing
//
//  Created by Adam Ahrens on 4/12/21.
//

import SwiftUI

// Paths are just like Views
// Use Geometry Reader
struct ContentView: View {
  var body: some View {
    ScrollView(.vertical) {
      Text("Hello, world!")
        .padding()
      
      Path { p in
        p.move(to: CGPoint(x: 200.0, y: 100.0))
        p.addLine(to: CGPoint(x: 100, y: 300))
        p.addLine(to: CGPoint(x: 300, y: 300))
        p.addLine(to: CGPoint(x: 200, y: 100))
        p.addLine(to: CGPoint(x: 100, y: 300))
      }
      .stroke(Color.red, lineWidth: 10)
      
      Path { p in
        p.move(to: CGPoint(x: 200.0, y: 100.0))
        p.addLine(to: CGPoint(x: 100, y: 300))
        p.addLine(to: CGPoint(x: 300, y: 300))
        p.addLine(to: CGPoint(x: 200, y: 100))
        p.addLine(to: CGPoint(x: 100, y: 300))
      }
      .fill(Color.blue)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
