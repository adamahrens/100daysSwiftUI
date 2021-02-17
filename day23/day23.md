# Why does SwiftUI use structs for views?

UIKit uses classes. SwiftUI use Structs

1. Performance (Structs are simpler, not as much overhead). Size of the View struct is based on the contents of it. No inheritance like in UIKit (e.g UIStackView inherits backgroundView from UIView but doesnt need them)
2. Forces us to isolate state. Data produces UI. 

# What is behind the main SwiftUI view?

There is nothing behind the view. You can't just fill a red. For example this doesn't do what we thinkg

```
 Text("Hello World").background(Color.red)
```

Correct solution would be to have `Text` fill the screen. E.g. `.frame(maxWidth: .infinity, maxHeight: .infinity)`

Views default to not leaving the safe area insets. Use `.edgesIgnoringSafeArea` and specificy the edges

# Modifier Order Matters!

Adding a modifier returns a new view after the modifier is applied. 

```
Button("Hello") {
    print(type(of: self.body))
}.background(Color.red)
 .frame(width: 200, height: 200)
```

In this order the background is applied that is constrained to the button content. Then we modify the frame. Imagine that the view is rendered after each modifier.

# Why some View for it's type

View by itself doesn't mean anything. It's like just saying we have an array. We have to specify what kind of array. String? Int? Using `some View` allows us to build up. It's going to return a specific type of View but I don't know right now. Could be a `Button` or `Image` or `Text`

`TupleView` is only overloaded to up to 10 views. Which is why we're constrainted to only having 10 subviews

# Conditional Modifiers 

Apply only when a condition is met. Use the ternary operator

` somethingToCheck ? Color.red : Color.blue`. Use `.toggle` on a boolean to toggle it.

# Environment Modifiers

A modifier that's applied to multiple views at one. If the child view override the font it takes precedent. No idea to determine which ones work as environment.
For example .blur doesn't behave this way.

```
 VStack {
     Text("First")
     Text("Second)
 }.font(.title)
```

 # Views as Properties

 Could use `let m = Text("First")`

 Then 

 ```
 VStack {
     m
 }
 ```

 Helps keep the body code clearer. Encourage using computed var properties for more complexitiy 

 # View Composition

 If you find you're using the same modifiers multiple times. DRY it out by creating a custom struct that takes in the what changes

 ```
  struct PillView: View {
      var text: String 

      var body: some View {
          Text(text)
            .font(.largeTItle)
            .padding()
            .foregroundColor(.white)
            .clipShape(Capsule())
      }
  }
 ```

 # Custom Modifiers

 Create a custom `ViewModifier` struct. Then you can call `.modifier(Title())`. That can be clunky so add an extension to `View` for a better named one.

 ```
 extension View {
     func titleStyle() -> some View {
         return self.modifier(Title())
     }
 }
 ```

 # Custom containers

 Lets try create a GridStack

 ```
 struct GridStack<Content: View>: View {
     let rows: Int
     let columns: Int

     // Closure to return content to show
     let content: (Int, Int) -> Content

     var body: some View {
         VStack {
             ForEach(0..<rows>) { row in
                HStack {
                    ForEach(0..<columns>) { column in 
                        self.content(row, column)
                    }
                }
             }
         }
     }
 }

 GridStack(rows: 4, columns: 4) { row, col in 
    Text("R\(row C\(col")
 }
 ```