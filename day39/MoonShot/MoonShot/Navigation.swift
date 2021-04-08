//
//  Navigation.swift
//  MoonShot
//
//  Created by Adam Ahrens on 4/8/21.
//

import SwiftUI

struct User: Codable {
  let first: String
  let last: String
  let phone: String
}

private func decode() {
  let input = """
    {
      "first": "Adam",
      "last": "Ahrens",
      "phone": "+16514085145"
    }
  """
  
  let decoder = JSONDecoder()
  if let data = input.data(using: .utf8), let user = try? decoder.decode(User.self, from: data) {
    print(user)
  }
}

struct Navigation: View {
    var body: some View {
      NavigationView {
        VStack {
          Text("Hello")
          NavigationLink(destination: Scrolling()) {
            Text("World")
          }
          Button("Decode", action: decode)
        }.navigationTitle("SwiftUI")
      }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
