# SwiftUIPhone

[![Version](https://img.shields.io/badge/spm-v1.4.1-blue)](https://github.com/JUSTINMKAUFMAN/SwiftUIPhone/releases)
[![License](https://img.shields.io/badge/license-MIT-brightgreen)](https://github.com/JUSTINMKAUFMAN/SwiftUIPhone/blob/master/LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-orange)](https://github.com/JUSTINMKAUFMAN/SwiftUIPhone)
[![Platform](https://img.shields.io/badge/platform-iOS-green)](https://github.com/JUSTINMKAUFMAN/SwiftUIPhone)

Run a SwiftUI app (or any SwiftUI view) in an iPhone Simulator "wrapper", directly on macOS!

To be clear, this is *not* an iPhone Simulator (nor any sort of emulation thereof). Rather, for those of 
us who took care to write our iOS apps without leaning on any platform-specific libraries (e.g. UIKit),
you can think of this as your reward: a way to build that app for macOS and run it at light speed 
(compared to an actual iPhone Simulator, that is) directly on any Mac, no Xcode or dev tools required.

<p align="center">
    <img src="/SwiftUIPhoneDemoMac.gif" />
</p>

## Compatibility

SwiftUIPhone is compatible with applications targeting **macOS 11+**.

## Installation

### Swift Package Manager

`SwiftUIPhone` is available as a Swift Package. To use it in your project, add it to your project's Swift Packages:

```swift
https://github.com/JUSTINMKAUFMAN/SwiftUIPhone.git
```

## Usage

`SwiftUIPhone` can be used as follows:

```swift
import SwiftUI
import SwiftUIPhone

@main
struct SwiftUIPhoneDemoApp: App {
    @SwiftUI.Environment(\.colorScheme) var colorScheme
    let appName: String = "SwiftUIPhone Demo"
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            VStack(alignment: .center) {
                Button("Launch SwiftUIPhone") { launch() }
            }.padding()
        }
    }
    
    func launch() {
        let window = NSWindow(
            contentRect: NSRect(x: 0.0, y: 0.0, width: 400.0, height: 809.0),
            styleMask: [.titled, .closable, .miniaturizable],
            backing: .buffered,
            defer: false
        )
        
        let view = SwiftUIPhone(
            rootView: AnyView(
                VStack(alignment: .center) {
                    Text("This is the root view of my app")
                }
                .background(colorScheme == .dark ? Color.black : Color.white)
            )
        )
        
        window.titlebarAppearsTransparent = false
        window.hasShadow = false
        window.isOpaque = false
        window.backgroundColor = NSColor.clear
        window.center()
        window.setFrameAutosaveName("\(appName).MainWindow")
        window.title = appName
        window.isReleasedWhenClosed = false
        window.contentView = NSHostingView(rootView: view)
        window.makeKeyAndOrderFront(nil)
    }
}
```

## Author

Justin Kaufman, jmkauf@gmail.com

## License

SwiftUIPhone is available under the MIT license. See the LICENSE file for more info.
