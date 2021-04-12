//
//  MoonApp.swift
//  MoonShot
//
//  Created by Adam Ahrens on 4/8/21.
//

import SwiftUI

let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
let missions: [Mission] = Bundle.main.decode("missions")

struct MoonApp: View {
  var body: some View {
    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: MissionDetail(mission: mission, astronauts: astronauts)) {
          HStack {
            Image(mission.imageName)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
              Text(mission.displayName)
              Text(mission.launch)
            }
          }
        }
      }.navigationTitle("Missions")
    }
  }
}

struct MoonApp_Previews: PreviewProvider {
    static var previews: some View {
        MoonApp()
    }
}
