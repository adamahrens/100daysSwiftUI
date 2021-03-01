//
//  ContentView.swift
//  Animations
//
//  Created by Adam Ahrens on 2/25/21.
//

import SwiftUI

struct CornerRotationModifier: ViewModifier {
  let amount: Double
  let anchor: UnitPoint
  
  func body(content: Content) -> some View {
    content
      .rotationEffect(.degrees(amount), anchor: anchor)
      .clipped()
  }
}

extension AnyTransition {
  static var pivot: AnyTransition {
    .modifier(active: CornerRotationModifier(amount: -90, anchor: .topLeading), identity: CornerRotationModifier(amount: 0, anchor: .topLeading))
  }
}

struct ContentView: View {
  
  // Need to use CGFloat for interacting with old
  // Apple APIs
  
  @State private var first = CGFloat(1.0)
  @State private var second = CGFloat(1.0)
  @State private var third = CGFloat(1.4)
  @State private var animation = CGFloat(1.0)
  @State private var animationExplicit = 0.0
  @State private var buttonEnabled = false
  @State private var dragAmount = CGSize.zero
  @State private var isShowingRed = false
  
  var body: some View {
    
    // Show/Hide Views with Gestures
    VStack {
      Button("Tap Me") {
        withAnimation {
          self.isShowingRed.toggle()
        }
      }
      
      if isShowingRed {
        Rectangle()
          .fill(Color.red)
          .frame(width: 200, height: 200)
          .transition(.pivot) // Our custom modifier
          //.transition(.asymmetric(insertion: .scale, removal: .opacity))
          //.transition(.scale)
      }
    }
    
    // Animating Gestures
    // Can do explict vs implicit
    /*
    LinearGradient(gradient:
                    Gradient(colors: [Color.red, Color.blue, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing
    )
      .frame(width: 300, height: 200)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .offset(dragAmount)
      .gesture(
        DragGesture().onChanged {
          self.dragAmount = $0.translation
        }.onEnded { _ in
          // Explicit
          withAnimation(.spring()) {
            self.dragAmount = .zero
          }
          
        })//.animation(.spring()) // Implict
      */
    
    // Control Animation Stack. Ordering of modifiers affect outcome
    // Order of animations also matters! So you need to include everything you
    // Wanted animated before the animation call occurs
    /*
    VStack {
      Button("Tap Me") {
        self.buttonEnabled.toggle()
      }
      .frame(width: 220, height: 220, alignment: .center)
      .background(buttonEnabled ? Color.blue : Color.red)
      .animation(.default)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: buttonEnabled ? 60.0 : 0))
      .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
    */
    
    // Explicit Animation. Not attached to a binding or view
    // Want to rotate
    /*
    VStack {
      Button("Tap Me") {
        withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
          self.animationExplicit += 360.0
        }
      }.padding(50)
      .background(Color.red)
      .foregroundColor(.white)
      .clipShape(Circle())
      .rotation3DEffect(.degrees(animationExplicit), axis: (x: 0, y: 1, z: 1))
    }
     */
    
    // Animation is taken by looking at the state of the view
    // And the end struct it wants to change to.
    // Then it knows how to animate
    // Creating animation binding
    
    /*
    VStack {
      Stepper("Scale amount", value: $animation.animation(), in: 1...10)
      Spacer()
      Button("Tap Me") {
        self.animation += 1.0
      }.padding(40)
      .background(Color.red)
      .foregroundColor(.white)
      .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
      .scaleEffect(animation)
    }
     */
    
    /*
    VStack {
      Button("Tap Me") {
        // Do Nothing
        self.first += 1.0
        
      }.padding(50)
      .background(Color.red)
      .foregroundColor(Color.white)
      .clipShape(Circle())
      .scaleEffect(first)
      .blur(radius: (first - 1) * 3.0)
      .animation(.default)
      
      Button("Do Something") {
        // Do Nothing
        self.second += 1.0
        
      }.padding(50)
      .background(Color.red)
      .foregroundColor(Color.white)
      .clipShape(Circle())
      .scaleEffect(second)
      .animation(.interpolatingSpring(stiffness: 50, damping: 1.0))
      
      Button("Again") {
        self.third += 1.0
      }.padding(50)
      .background(Color.red)
      .foregroundColor(Color.white)
      .clipShape(Circle())
      .overlay(
        Circle()
          .stroke(Color.red)
          .scaleEffect(third)
          .opacity(Double(2 - third))
          .animation(
            Animation
              .easeOut(duration: 1.0)
              .repeatForever(autoreverses: false))
      ).onAppear(perform: {
        self.third = 2.0
      })
    }
     */
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
