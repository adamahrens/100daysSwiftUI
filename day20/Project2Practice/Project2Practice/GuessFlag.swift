//
//  GuessFlag.swift
//  Project2Practice
//
//  Created by Adam Ahrens on 2/16/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
  
  var imageName: String
  
  var body: some View {
    Image(imageName)
      .renderingMode(.original)
      .clipShape(Capsule())
      .overlay(Capsule().stroke(Color.black, lineWidth: 2.0))
      .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8)
  }
}

struct GuessTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.white)
      .font(.largeTitle)
  }
}

extension View {
  func guessTitleStyle() -> some View {
    self.modifier(GuessTitle())
  }
}

struct GuessFlag: View {
  
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "USA"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var scoreMessage = ""
  @State private var totalGuesses = 0
  @State private var correctGuesses = 0
  
  var body: some View {
    ZStack {
      AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .purple, .red]), center: .center).edgesIgnoringSafeArea(.all)
      VStack(spacing: 30) {
        VStack {
          Text("Tap flag of")
            .foregroundColor(.white)
            .font(.headline)
          
          Text(countries[correctAnswer])
            .fontWeight(.black)
            .guessTitleStyle()
          
          ForEach(0..<3) { number in
            Button(action: {
              // Determine if flag tapping is correct
              self.flagTapped(number: number)
            }, label: {
              FlagImage(imageName: self.countries[number])
            })
          }
          
          Text("You've guessed \(correctGuesses) out of \(totalGuesses)")
            .font(.callout)
            .fontWeight(.bold)
          Spacer()
        }
      }
    }.alert(isPresented: $showingScore, content: {
      Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Try Again"), action: {
        self.reset()
      }))
    })
  }
  
  private func flagTapped(number: Int) {
    totalGuesses += 1
    
    if number == correctAnswer {
      correctGuesses += 1
      
      scoreTitle = "Correct"
      scoreMessage = "You've gotten \(correctGuesses) out of \(totalGuesses)"
    } else {
      scoreTitle = "Wrong"
      scoreMessage = "That's the flag of \(countries[number])"
    }
    
   
    showingScore = true
  }
  
  private func reset() {
    countries = countries.shuffled()
    correctAnswer = Int.random(in: 0...2)
  }
}

struct GuessFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessFlag()
    }
}
