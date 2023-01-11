// FPButton.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SFSafeSymbols
import SwiftUI

public struct FPButton: View {
    public init(label: String, icon: Image? = nil, width: CGFloat? = nil) {
        self.label = label
        self.icon = icon
        self.width = width
    }

    var label: String
    var icon: Image? = nil
    var width: CGFloat? = nil
    public var body: some View {
        Button {
            print(label)
        } label: {
            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text(label)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }

    }
}

struct FPButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FPButton(label: "", icon: Image(systemSymbol: .squareGrid3x3))
            FPButton(label: "Release")
            FPButton(label: "Release")
        }
        .background(Color.gray)
    }
}
