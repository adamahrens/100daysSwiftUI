//
//  ThrowImage.swift
//  RockPaperScissors
//
//  Created by Adam Ahrens on 2/17/21.
//

import SwiftUI

struct ThrowImage: View {
  var image: String
  
  var body: some View {
    Image(image)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 100, height: 100, alignment: .center)
  }
}

struct ThrowImage_Previews: PreviewProvider {
    static var previews: some View {
        ThrowImage(image: "rock")
    }
}
