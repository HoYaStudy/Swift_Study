//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
    }
}

// Method 1 : with UIKit
//PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())

// Method 2 : iOS 13 and over supported
PlaygroundPage.current.setLiveView(ContentView())
