// ThreeByTwo.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SwiftUI

struct ThreeByTwo: View {
    var buttonRow1: [String]
    var buttonRow2: [String]

    var body: some View {
        GeometryReader { geo in
            Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    ForEach(buttonRow1, id: \.self) { button in
                        FPButton(label: button)
                    }
                }
                .frame(
                    width: geo.size.width / 4,
                    height: geo.size.width / 4
                )
                .background(Color.gray)
                GridRow {
                    ForEach(buttonRow2, id: \.self) { button in
                        FPButton(label: button)
                    }
                }
                .frame(
                    width: geo.size.width / 4,
                    height: geo.size.width / 4
                )
                .background(Color.gray)
            }
        }
    }
}

struct ThreeByTwo_Previews: PreviewProvider {
    static var previews: some View {
        ThreeByTwo(
            buttonRow1: ["Live", "Scene", "Cue"],
            buttonRow2: ["Macro", "List", "Page"]
        )
    }
}
