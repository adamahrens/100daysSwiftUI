//
//  Game.swift
//  Edutainment
//
//  Created by Adam Ahrens on 3/1/21.
//

import SwiftUI

struct Game: View {
  let gameType: GameType
  
  // Map of questions answered and if correct or not
  @State private var answered = [Question: Bool]()
  
  private func backgroundColor(for question: Question) -> Color {
    if let answered = answered[question] {
      if answered {
        return Color.green
      } else {
        return Color.red
      }
    }
    
    return Color.white
  }
  
  var body: some View {
    List {
      ForEach(gameType.questions, id: \.self.id) { question in
        let didAnswer = answered[question]
        HStack {
          if let _ = didAnswer {
            Text(question.display)
              .font(.title)
              .foregroundColor(.white)
          } else {
            Text(question.display)
              .font(.title)
            
            Spacer()
            
            Button("Correct") {
              if question.isCorrect {
                self.answered[question] = true
              } else {
                self.answered[question] = false
              }
            }
            .font(.title3)
            .foregroundColor(.green)
            .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.green, lineWidth: 1)
            )
            
            Spacer()
            
            Button("Wrong") {
              if question.isCorrect == false {
                self.answered[question] = true
              } else {
                self.answered[question] = false
              }
            }
            .font(.title3)
            .foregroundColor(.red)
            .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.red, lineWidth: 1)
            )
          }
        }
        .padding()
        .background(self.backgroundColor(for: question))
      }
    }.listStyle(GroupedListStyle())
  }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
      Game(gameType: GameType(table: 3, count: QuestionCount.five))
    }
}
