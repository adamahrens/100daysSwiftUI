//
//  ContentView.swift
//  Edutainment
//
//  Created by Adam Ahrens on 3/1/21.
//

import SwiftUI

struct ContentView: View {

  @State private var startGame = false
  @State private var game: GameType!
  
  var body: some View {
    NavigationView {
      if startGame {
        Game(gameType: game)
          .animation(.easeInOut)
          .navigationTitle(Text("Game Time!"))
      } else {
        GameSetup() { gameType in
          self.game = gameType
          self.startGame.toggle()
        }.navigationTitle(Text("Edutainment"))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
