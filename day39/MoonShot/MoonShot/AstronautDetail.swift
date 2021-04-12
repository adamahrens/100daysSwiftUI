//
//  AstronautDetail.swift
//  MoonShot
//
//  Created by Adam Ahrens on 4/9/21.
//

import SwiftUI

struct AstronautDetail: View {
  let astronaut: Astronaut
  private let missions: [Mission] = Bundle.main.decode("missions")
  private let myMissions: [String]
  
  init(astronaut: Astronaut) {
    self.astronaut = astronaut
    self.myMissions = missions.filter { $0.crew.contains(where: { $0.name == astronaut.id})}.map { $0.displayName }
  }
  
  var body: some View {
    GeometryReader { reader in
      ScrollView(.vertical) {
        VStack(alignment: .center) {
          Image(astronaut.imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: reader.size.width * 0.7)
            .padding(.top)
          
          Text("My Missions").font(.headline)
          ForEach(myMissions, id: \.self) {
            Text($0)
              .font(.subheadline)
          }
          Text(astronaut.description)
            .padding()
        }
        
      }
    }.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
  }
}

struct AstronautDetail_Previews: PreviewProvider {
    static var previews: some View {
      let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
      AstronautDetail(astronaut: astronauts.first!)
    }
}
