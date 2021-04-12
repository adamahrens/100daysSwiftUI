//
//  Models.swift
//  MoonShot
//
//  Created by Adam Ahrens on 4/8/21.
//

import Foundation

struct CrewMember {
  let role: String
  let astronaut: Astronaut
}

struct Astronaut: Codable, Identifiable {
  let id: String
  let name: String
  let description: String
  
  var imageName: String {
    return id
  }
}

struct Mission: Codable, Identifiable {
  struct Crew: Codable, Hashable {
    let name: String
    let role: String
  }
  
  let id: Int
  let description: String
  let crew: [Crew]
  let launchDate: Date?
  
  var displayName: String {
    return "Apollo \(id)"
  }
  
  var launch: String {
    guard
      let date = launchDate
    else { return "N/A" }
    
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    let formattedDate = formatter.string(from: date)
    return formattedDate
  }
  
  var imageName: String {
    return "apollo\(id)"
  }
}

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T{
    guard
      let url = self.url(forResource: file, withExtension: "json")
    else { fatalError("Can't find JSON file") }
    
    guard
      let data = try? Data(contentsOf: url)
    else { fatalError("Unable to convert URL to Data") }
    
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "y-MM-dd"
    decoder.dateDecodingStrategy = .formatted(formatter)
    
    guard
      let objects = try? decoder.decode(T.self, from: data)
    else { fatalError("Unable to decode JSON file to Object") }
    
    return objects
  }
}
