//
//  QuestionCount.swift
//  Edutainment
//
//  Created by Adam Ahrens on 3/1/21.
//

import Foundation

enum QuestionCount: String, Equatable, CaseIterable, Identifiable {
  var id: String { self.rawValue }
  case five
  case ten
  case twenty
  case all
  
  var count: Int {
    switch self {
      case .five : return 5
      case .ten : return 10
      case .twenty : return 20
      case .all : return 30
    }
  }
}
