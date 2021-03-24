//
//  GameType.swift
//  Edutainment
//
//  Created by Adam Ahrens on 3/12/21.
//

import Foundation

enum Answer: Equatable {
  case correct
  case wrong
}

struct Question: Hashable {
  let id: UUID
  let first: Int
  let second: Int
  let answer: Int
  let isCorrect: Bool
  
  var display: String {
    return "\(first) x \(second) = \(answer)"
  }
}

struct GameType {
  let table: Int
  let count: QuestionCount
  let questions: [Question]
  
  init(table: Int, count: QuestionCount) {
    self.table = table
    self.count = count
    
    var responses = [Question]()
    for _ in 0..<count.count {
      let first = Int.random(in: 1...table)
      let second = Int.random(in: 1...table)
      let actualValue = first * second
      
      // Get correct result 70 % of the time
      let difficulty = Double.random(in: 0.0...1.0)
      if (difficulty >= 0.7) {
        // Show correct answer
        responses.append(Question(id: UUID(), first: first, second: second, answer: actualValue, isCorrect: true))
      } else {
        // Show incorrect anser
        let random = Int.random(in: 1..<actualValue)
        responses.append(Question(id: UUID(), first: first, second: second, answer: random, isCorrect: false))
      }
    }
    
    self.questions = responses
  }
}
