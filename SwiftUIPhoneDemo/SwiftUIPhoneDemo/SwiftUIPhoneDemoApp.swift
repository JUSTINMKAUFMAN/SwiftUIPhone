//
//  SwiftUIPhoneDemoApp.swift
//  SwiftUIPhoneDemo
//
//  Created by Justin Kaufman on 8/28/21.
//

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
