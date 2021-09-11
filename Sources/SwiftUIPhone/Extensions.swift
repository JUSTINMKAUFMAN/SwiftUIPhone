import Foundation
import SwiftUI

extension Image {
    static let phoneWhite: Image = Image(packageResource: "PhoneWhite", ofType: "png")
    static let phoneBlack: Image = Image(packageResource: "PhoneBlack", ofType: "png")
    static let phoneFrame: Image = Image(packageResource: "PhoneFrame", ofType: "png")
    
    init(packageResource name: String, ofType type: String) {
        #if canImport(UIKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(uiImage: image)
        #elseif canImport(AppKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = NSImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(nsImage: image)
        #else
        self.init(name)
        #endif
    }
}
