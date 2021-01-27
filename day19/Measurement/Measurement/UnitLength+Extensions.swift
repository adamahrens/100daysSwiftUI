//
//  UnitLength+Extensions.swift
//  Measurement
//
//  Created by Adam Ahrens on 1/27/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import Foundation

extension UnitLength {
  func display() -> String {
    switch self {
      case .astronomicalUnits : return "astronomicalUnits"
      case .centimeters : return "cm"
      case .decameters : return "dm"
      case .decimeters : return "dcm"
      case .fathoms : return "fm"
      case .feet : return "ft"
      case .furlongs : return "fur"
      case .hectometers :  return "hm"
      case .inches : return "in"
      case .kilometers : return "km"
      case .lightyears : return "ly"
      case .megameters : return "Mm"
      case .meters : return "m"
      case .millimeters : return "mm"
      case .micrometers : return "mcm"
      case .miles : return "mi"
      case .yards : return "yd"
      default : return "unknown"
    }
  }
}
