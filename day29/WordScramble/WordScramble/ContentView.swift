//
//  ContentView.swift
//  WordScramble
//
//  Created by Adam Ahrens on 2/24/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var usedWords = [String]()
  
  // Word player needs to guess
  @State private var rootWord = ""
  
  // Words they've guessed
  @State private var newWord = ""
  
  @State private var errorTitle = ""
  @State private var errorMessage = ""
  @State private var showingError = false
  
  private func startGame() {
    rootWord = ""
    newWord = ""
    usedWords.removeAll()
    
    if let wordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt"), let wordsString = try? String(contentsOf: wordsUrl) {
      let words = wordsString.components(separatedBy: .newlines)
      if let randomWord = words.randomElement() {
        rootWord = randomWord
        return
      } else {
        fatalError("Unable to fetch a random word")
      }
    } else {
      fatalError("Unable to load words.txt")
    }
  }
  
  private func addNewWord() {
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    
    guard
      answer.count >= 3
    else {
      displayError(title: "Too Short", message: "Word has to be at least 3 characters")
      return
    }
    
    guard
      answer != rootWord
    else {
      displayError(title: "Same", message: "Word cant be the same as the guess")
      return
    }
    
    // Ensure it's valid
    guard
      isOriginal(answer)
    else {
      displayError(title: "Unoriginal", message: "Word has been used before")
      return
    }
    
    guard
      canBeMade(answer)
    else {
      displayError(title: "Not subset", message: "Word cant be combined to form the root")
      return
    }
    
    guard
      isValidWord(answer)
    else {
      displayError(title: "Invalid", message: "Word is not a valid English word")
      return
    }
    
    usedWords.insert(answer, at: 0)
    newWord = ""
  }
  
  private func isOriginal(_ word: String) -> Bool {
    return usedWords.contains(word) == false
  }
  
  private func canBeMade(_ word: String) -> Bool {
    let rootSet = Set(rootWord)
    let guessSet = Set(word)
    return guessSet.isSubset(of: rootSet)
  }
  
  private func isValidWord(_ word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.count)
    let foundRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    return foundRange.location == NSNotFound
  }
  
  private func displayError(title: String, message: String) {
    errorTitle = title
    errorMessage = message
    showingError = true
  }
  
  var body: some View {
    NavigationView {
      VStack {
        TextField("Enter your world", text: $newWord, onCommit: addNewWord)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocapitalization(.none)
          .padding()
        
        List {
          Section(header: Text("Use Words")) {
            ForEach(usedWords, id: \.self) { word in
              HStack {
                Image(systemName: "\(word.count).circle")
                Text(word)
              }
            }
          }
        }.listStyle(GroupedListStyle())
      }
      .navigationBarItems(trailing: Button("Start Game", action: startGame))
      .navigationTitle(rootWord)
      .onAppear(perform: startGame)
      .alert(isPresented: $showingError) {
        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
      }
    }
  }
  
//  @State private var wifiOn = false
//
//  var body: some View {
//    List {
//      ForEach(0..<5) {
//        Text("Dyanmic Row \($0)")
//      }
//
//      Section(header: Text("Static Row")) {
//        Text("Eggs")
//        Text("Milk")
//        Text("Bread")
//        Toggle("Set Wifi", isOn: $wifiOn)
//      }
//
//      Section(header: Text("Optional")) {
//        Text("Sonos")
//      }
//    }.listStyle(GroupedListStyle())
//  }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
