//
//  GameSetup.swift
//  Edutainment
//
//  Created by Adam Ahrens on 3/1/21.
//

import SwiftUI

typealias GameSetupAction = (GameType) -> Void

struct GameSetup: View {
  @State private var multiplication = 1
  @State private var selectedQuestion = QuestionCount.all
  
  let callback: GameSetupAction
  
  var body: some View {
    Form {
      Section(header: Text("Select Practice Table")) {
        Stepper(value: $multiplication, in: 1...14) {
          Text("\(multiplication) x \(multiplication)")
        }
      }
      
      Section(header: Text("Number of questions")) {
        Picker("Questions", selection: $selectedQuestion) {
          ForEach(QuestionCount.allCases, id: \.self) { question in
            Text("\(question.rawValue.capitalized)")
          }
        }.pickerStyle(SegmentedPickerStyle())
      }
      
      Section {
        Button("Start Game") {
          self.callback(GameType(table: multiplication, count: selectedQuestion))
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 64, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.purple)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
      }
    }.background(Color.purple)
  }
}

struct GameSetup_Previews: PreviewProvider {
    static var previews: some View {
      GameSetup() { _ in
        
      }
    }
}
