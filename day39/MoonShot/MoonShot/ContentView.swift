//
//  ContentView.swift
//  MoonShot
//
//  Created by Adam Ahrens on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack {
        // GeometryReader to fill a container
        GeometryReader { g in
          Image("Computer")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: g.size.width)
        }
        Image("Computer")
          .frame(width: 300, height: 300)
          .clipped()
        Image("Computer")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 300, height: 300)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
