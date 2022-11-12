// RowWithIcon.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SwiftUI
import SFSafeSymbols

public struct RowWithIcon: View {
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
            color.frame(width: 30, height: 30)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemSymbol: symbol)
                        .foregroundColor(.white)
                }
                .padding(.trailing)
            Text(labelText)
            Spacer()
        }
    }
}

struct RowWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        RowWithIcon(labelText: "Test label", color: .gray, symbol: .star)
    }
}
