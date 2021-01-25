//
//  Tips.swift
//  WeSplit
//
//  Created by Adam Ahrens on 1/25/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import Foundation

enum Tips: String, CaseIterable, Identifiable {
  var id: String { self.rawValue }
  
  case zero = "0%"
  case ten = "10%"
  case fifteen = "15%"
  case twenty = "20%"
  case twentyFive = "25%"
  
  var percentage: Double {
    switch self {
      case .zero : return 0.0
      case .ten: return 0.1
      case .fifteen: return 0.15
      case .twenty: return 0.2
      case .twentyFive: return 0.25
    }
  }
}
