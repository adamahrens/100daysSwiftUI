//
//  ImagePaint.swift
//  Drawing
//
//  Created by Adam Ahrens on 4/12/21.
//

import SwiftUI



struct ImagePaint: View {
  @State private var amount: CGFloat = 0.0
  
    var body: some View {
      VStack {
        ZStack {
          Circle()
            .fill(Color.red)
            .frame(width: 200 * amount)
            .offset(x: -50, y: -80)
            .blendMode(.screen)
          
          Circle()
            .fill(Color.green)
            .frame(width: 200 * amount)
            .offset(x: 50, y: -80)
            .blendMode(.screen)
          
          Circle()
            .fill(Color.blue)
            .frame(width: 200 * amount)
            .blendMode(.screen)
        }
        .frame(width: 300, height: 300)
        
        Slider(value: $amount)
          .padding()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.black)
      .edgesIgnoringSafeArea(.all)
      
//      ZStack {
//        Image("SwiftIcon")
//          .resizable()
//
//        Rectangle()
//          .fill(Color.red)
//          .blendMode(.multiply)
//      }.frame(width: 200, height: 200)
//      .clipped()
      
//      Image("SwiftIcon")
//        .resizable()
//        .colorMultiply(.blue)
    }
}

struct ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaint()
    }
}
