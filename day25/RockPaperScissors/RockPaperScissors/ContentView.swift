//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Adam Ahrens on 2/17/21.
//

import SwiftUI

extension View {
  @ViewBuilder func hide(_ shouldHide: Bool) -> some View {
    switch shouldHide {
      case true: self.hidden()
      case false: self
    }
  }
}

struct ContentView: View {
  
  private func calculateResult(option: String) {
    guard hideMachineSelection else { return }
    if let userSelection = options.firstIndex(of: option) {
      // Array ordered according to what would win. Rock beats scissors
      let distance = userSelection - machineSelection
      if distance == 1 || distance == -2 {
        roundsWon += 1
      }
      
      hideMachineSelection = false
    }
  }
  
  private func resetGame() {
    machineSelection = Int.random(in: 0...2)
    hideMachineSelection = true
  }
  
  @State private var options = ["rock", "paper", "scissors"]
  @State private var machineSelection = Int.random(in: 0...2)
  @State private var hideMachineSelection = true
  @State private var roundsWon = 0
  
  var body: some View {
    ZStack {
      LinearGradient(gradient:
                      Gradient(colors: [Color.red, Color.blue]),
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      
      VStack {
        Text("Rock, Paper, Scissors")
          .font(.largeTitle)
          .foregroundColor(.white)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .padding()
        
        Text("Rounds won: \(roundsWon)")
          .font(.body)
          .foregroundColor(.white)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .padding()
        
        HStack {
          ForEach(options, id: \.self) {
            GameOption(imageName: $0) { option in
              calculateResult(option: option)
            }
          }
        }
        .padding()
        
        Text("vs")
          .font(.largeTitle)
          .foregroundColor(.white)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .padding()
          .hide(hideMachineSelection)
        
          ThrowImage(image: options[machineSelection])
          .hide(hideMachineSelection)
        
        Spacer()
        
        Button("Try Again") {
          resetGame()
        }
        .frame(width: 200, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .foregroundColor(.white)
        .font(.largeTitle)
        .background(Color.black)
        .cornerRadius(8.0)
        .hide(hideMachineSelection)
        
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
