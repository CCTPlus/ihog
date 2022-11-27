// RowIcon.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github     @heyjaywilson
//              website  cctplus.dev

import SFSafeSymbols
import SwiftUI

///Row with an icon and text
public struct RowIcon: View {
    var color: Color
    var symbol: SFSymbol

    public init(color: Color, symbol: SFSymbol) {
        self.color = color
        self.symbol = symbol
    }

    public var body: some View {
        color.frame(width: 30, height: 30)
            .cornerRadius(5.0)
            .overlay {
                Image(systemSymbol: symbol)
                    .foregroundColor(.white)
            }
    }
}

struct RowIcon_Preview: PreviewProvider {
    static var previews: some View {
        RowIcon(color: .gray, symbol: .star)
    }
}
