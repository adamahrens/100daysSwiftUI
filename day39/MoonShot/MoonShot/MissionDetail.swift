//
//  MissionDetail.swift
//  MoonShot
//
//  Created by Adam Ahrens on 4/9/21.
//

import SwiftUI

struct MissionDetail: View {
  
  let mission: Mission
  let crew: [CrewMember]
  
  init(mission: Mission, astronauts: [Astronaut]) {
    self.mission = mission
    self.crew = mission.crew.compactMap { crew in
      let role = crew.role
      let astronaut = astronauts.first { $0.id == crew.name }
      if let a = astronaut {
        return CrewMember(role: role, astronaut: a)
      }
      
      return nil
    }
  }
  
  var body: some View {
    GeometryReader { reader in
      ScrollView(.vertical) {
        VStack(alignment: .center) {
          Image(mission.imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: reader.size.width * 0.7)
            .padding(.top)
          
          Text(mission.description)
            .padding()
          
          Divider()
          
          Section(header: Text("Launch Date")) {
            Text(mission.launch)
          }
      
          List {
            Section(header: Text("Crew").font(.title)) {
              ForEach(0..<crew.count) { index in
                let member = crew[index]
                NavigationLink(destination: AstronautDetail(astronaut: member.astronaut)) {
                  HStack {
                    Image(member.astronaut.imageName)
                      .resizable()
                      .scaledToFit()
                      .clipShape(Circle())
                      .frame(width: 150, height: 150)
                    
                    VStack {
                      Text(member.astronaut.name).font(.headline)
                      Text(member.role).font(.subheadline)
                    }
                  }
                }.buttonStyle(PlainButtonStyle())
              }
            }
          }.listStyle(GroupedListStyle())
          
          Spacer(minLength: 25)
        }
      }
    }.navigationBarTitle(Text(mission.displayName), displayMode: .inline)
  }
}

struct MissionDetail_Previews: PreviewProvider {
    static var previews: some View {
      let missions: [Mission] = Bundle.main.decode("missions")
      let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
      MissionDetail(mission: missions.first!, astronauts: astronauts)
    }
}
