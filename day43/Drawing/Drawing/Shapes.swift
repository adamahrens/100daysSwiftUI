//
//  Shapes.swift
//  Drawing
//
//  Created by Adam Ahrens on 4/12/21.
//

import SwiftUI

struct Triangle: Shape {
  
  // Shape protocol
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    return path
  }
}
struct Shapes: View {
  var body: some View {
    VStack {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      
      Triangle()
        .fill(Color.blue)
        .frame(width: 50, height: 50)
      
      Circle()
        .strokeBorder(Color.blue, lineWidth: 4)
        .frame(width: 100, height: 100)
    }
    
  }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
