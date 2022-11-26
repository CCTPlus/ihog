// KindKeys.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SwiftUI

struct KindKeys: View {
    var body: some View {
        GeometryReader { geo in
            Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    FPButton(label: "Intensity")
                    FPButton(label: "Position")
                    FPButton(label: "Colour")
                    FPButton(label: "Beam")
                }
                .frame(
                    width: geo.size.width / 4,
                    height: geo.size.width / 4
                )
                .background(Color.gray)
                GridRow {
                    FPButton(label: "Effect")
                    FPButton(label: "Time")
                    FPButton(label: "Group")
                    FPButton(label: "Fixture")
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

struct KindKeys_Previews: PreviewProvider {
    static var previews: some View {
        KindKeys()
    }
}
