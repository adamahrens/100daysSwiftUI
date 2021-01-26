//
//  UIApplication+Extensions.swift
//  WeSplitAgain
//
//  Created by Adam Ahrens on 1/26/21.
//  Copyright © 2021 Adam Ahrens. All rights reserved.
//

import UIKit

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
