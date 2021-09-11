//
//  SwiftUIPhone.swift
//  SwiftUIPhone
//
//  Created by Justin Kaufman on 8/20/21.
//

import SwiftUI

public struct SwiftUIPhone: View {
    @SwiftUI.Environment(\.colorScheme) var colorScheme
    private let rootView: AnyView
    private var phoneImage: Image { colorScheme == .dark ? Image.phoneBlack : Image.phoneWhite }

    public init(rootView: AnyView = AnyView(Text("This is the root view of my app"))) {
        self.rootView = rootView
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Spacer().frame(width: 5.0)
            
            HStack(alignment: .center, spacing: 0.0) {
                Spacer().frame(width: 5.0)
                
                ZStack {
                    phoneImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400.0, height: 809.0)
                    
                    rootView
                        .frame(width: 355.5, height: 770.75)
                    
                    Image.phoneFrame
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400.0, height: 809.0)
                        .allowsHitTesting(false)
                }
                Spacer().frame(width: 5.0)
            }
            
            Spacer().frame(width: 5.0)
        }
        .frame(width: 410.0, height: 819.0)
    }
}

struct SwiftUIPhone_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPhone()
    }
}
