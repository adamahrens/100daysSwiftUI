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
  @State private var answered = [Question: Answer]()
  
  private func backgroundColor(for question: Question) -> Color {
    if let answer = answered[question] {
      if answer == .correct && question.isCorrect {
        return Color.green
      } else if answer == .wrong && !question.isCorrect {
        return Color.green
      } else {
        return Color.red
      }
    }
    
    return Color.white
  }
  
  private func answer(question: Question, with answer: Answer) {
    self.answered[question] = answer
  }
  
  var body: some View {
    List {
      ForEach(gameType.questions, id: \.self.id) { question in
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8.0, content: {
          HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8.0, content: {
            if let _ = self.answered[question] {
              Text(question.display)
                .font(.title)
                .foregroundColor(.white)
            } else {
              VStack {
                Text(question.display)
                  .font(.title)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8.0, content: {
                  Button("Correct") {
                    self.answer(question: question, with: .correct)
                  }
                  .font(.title3)
                  .foregroundColor(.green)
                  .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                  .overlay(
                    RoundedRectangle(cornerRadius: 8)
                      .stroke(Color.green, lineWidth: 1)
                  )
                  
                  Button("Wrong") {
                    self.answer(question: question, with: .wrong)
                  }
                  .font(.title3)
                  .foregroundColor(.red)
                  .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                  .overlay(
                    RoundedRectangle(cornerRadius: 8)
                      .stroke(Color.red, lineWidth: 1)
                  )
                })
              }
            }
          })
        })
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
