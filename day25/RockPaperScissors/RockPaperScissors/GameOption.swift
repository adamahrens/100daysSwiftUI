//
//  GameOptions.swift
//  RockPaperScissors
//
//  Created by Adam Ahrens on 2/17/21.
//

import SwiftUI

struct GameOption: View {
  var imageName: String
  var selection: (String) -> Void
  
  var body: some View {
    Button(action: {
      selection(imageName)
    }, label: {
      ThrowImage(image: imageName)
    })
  }
}

struct GameOption_Previews: PreviewProvider {
    static var previews: some View {
      GameOption(imageName: "rock") { selection in
      }
    }
}
