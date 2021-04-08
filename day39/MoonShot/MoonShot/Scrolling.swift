//
//  Scrolling.swift
//  MoonShot
//
//  Created by Adam Ahrens on 4/8/21.
//

import SwiftUI

struct Scrolling: View {
    var body: some View {
      ScrollView(.vertical) {
        VStack(spacing: 10) {
          ForEach(0..<100) {
            Text("\($0)").font(.body)
          }
        }.frame(maxWidth: .infinity)
      }
    }
}

struct Scrolling_Previews: PreviewProvider {
    static var previews: some View {
        Scrolling()
    }
}
