//
//  ContentView.swift
//  iExpense
//
//  Created by Adam Ahrens on 3/24/21.
//

import SwiftUI

// @State wrapper for local view. Doesn't work when sharing
// To share data between mutiple views. Use classes instead of structs
// For structs changing anything causes @State to notice the change
// With class we can just update properties but doesn't force re render
// Need something more powerful. Enter @ObservedObject

struct AuthUser: Codable {
  let username: String
  let password: String
}

class User: ObservableObject {
  
  // Want to notify any views that changes happen. SwiftUI views that are watching
  // will reload
  @Published var lastName = "Jenkins"
  @Published var firstName = "Leroy"
  
  init(lastName: String, firstName: String) {
    self.lastName = lastName
    self.firstName = firstName
  }
}

struct ContentView: View {
//  @State private var user = User(lastName: "Ahrens", firstName: "Adam")
  @ObservedObject private var user = User(lastName: "Ahrens", firstName: "Adam")
  @State private var showingSheet = false
  @State private var tapCount = UserDefaults.standard.integer(forKey: "TapCount")

  var body: some View {
    VStack {
      Text("Greetings")
      Text(user.lastName)
      Text(user.firstName)
      TextField("Change First", text: $user.firstName)
      TextField("Change Last", text: $user.lastName)
      Button("Show Sheet") {
        showingSheet.toggle()
      }
      Button("Tap Count: \(tapCount)") {
        self.tapCount += 1
        UserDefaults.standard.set(self.tapCount, forKey: "TapCount")
      }
      Button("Encode") {
        let authUser = AuthUser(username: "hello", password: "password123!")
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(authUser) {
          UserDefaults.standard.data(forKey: "AuthUser")
        }
      }
    }
    .padding()
    .sheet(isPresented: $showingSheet, content: {
      // Contents of the shit
      NextScreen(name: "\(user.firstName) \(user.lastName)")
    })
  }
}

struct NextScreen: View {
  
  // Is the view presented on screen?
  // Gives a method to dismiss it
  @Environment(\.presentationMode) var mode
  
  @State private var numbers = [Int]()
  @State private var currentNumber = 1
  
  var name: String
  
  func removeRows(at offsets: IndexSet) {
    numbers.remove(atOffsets: offsets)
  }
  
  var body: some View {
    NavigationView {
      VStack {
        Text(name)
        Button("Dismiss") {
          // Mode is actually a Binding property
          self.mode.wrappedValue.dismiss()
        }
        List {
          // To use onDelete have to have a ForEach
          ForEach(numbers, id: \.self) {
            Text("\($0)")
          }.onDelete(perform: { indexSet in
            removeRows(at: indexSet)
          })
        }
        
        Button("Add Number") {
          self.numbers.append(self.currentNumber)
          self.currentNumber += 1
        }
      }
    }.navigationBarItems(leading: EditButton())
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
