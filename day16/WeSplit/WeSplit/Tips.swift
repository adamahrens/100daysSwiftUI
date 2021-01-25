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
}
