// Keypad.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SwiftUI

struct Keypad: View {
    var body: some View {
        GeometryReader { geo in
            Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    FPButton(label: "<-")
                    FPButton(label: "/")
                    FPButton(label: "-")
                    FPButton(label: "+")
                }.frame(
                    width: (geo.size.width-3)/4,
                    height: (geo.size.width-3)/4)
                .background(Color.gray)
                GridRow {
                    FPButton(label: "7")
                    FPButton(label: "8")
                    FPButton(label: "9")
                    FPButton(label: "Thru")
                }.frame(
                    width: (geo.size.width-3)/4,
                    height: (geo.size.width-3)/4)
                .background(Color.gray)

                GridRow {
                    FPButton(label: "4")
                    FPButton(label: "5")
                    FPButton(label: "6")
                    FPButton(label: "Full")
                }.frame(
                    width: (geo.size.width-3)/4,
                    height: (geo.size.width-3)/4)
                .background(Color.gray)
                GridRow {
                    FPButton(label: "1")
                    FPButton(label: "2")
                    FPButton(label: "3")
                    FPButton(label: "@")
                }.frame(
                    width: (geo.size.width-3)/4,
                    height: (geo.size.width-3)/4)
                .background(Color.gray)

                GridRow {
                    FPButton(label: "0")
                    FPButton(label: ".")
                    FPButton(label: "Enter")
                        .gridCellColumns(2)
                        .frame(
                            width: (geo.size.width-3)/2,
                            height: (geo.size.width-3)/4)
                        .background(Color.gray)
                }.frame(
                    width: (geo.size.width-3)/4,
                    height: (geo.size.width-3)/4)
                .background(Color.gray)

            }
        }
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        Keypad()
    }
}
