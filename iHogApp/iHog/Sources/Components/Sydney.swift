// RowWithIcon.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SFSafeSymbols
import SwiftUI

///Row with an icon and text
public struct Sydney: View {
    var labelText: String
    var color: Color
    var symbol: SFSymbol

    public init(labelText: String, color: Color, symbol: SFSymbol) {
        self.labelText = labelText
        self.color = color
        self.symbol = symbol
    }

    public var body: some View {
        HStack {
            RowIcon(color: color, symbol: symbol)
            Text(labelText)
            Spacer()
        }
    }
}

struct RowWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        Sydney(labelText: "Test label", color: .gray, symbol: .star)
    }
}
