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
            Grid {
                GridRow {
                    FPButton(label: "1")
                    FPButton(label: "1")
                    FPButton(label: "1")
                    FPButton(label: "1")
                }
                .frame(width: 75, height: 75)
                .background(Color.gray)
                .cornerRadius(5.0)
                GridRow {
                    FPButton(label: "7")
                    FPButton(label: "8")
                    FPButton(label: "9")
                    FPButton(label: "1")
                }
                .frame(width: 75, height: 75)
                .background(Color.gray)
                .cornerRadius(5.0)
                GridRow {
                    FPButton(label: "4")
                    FPButton(label: "5")
                    FPButton(label: "6")
                    FPButton(label: "1")
                }
                .frame(width: 75, height: 75)
                .background(Color.gray)
                .cornerRadius(5.0)
                GridRow {
                    FPButton(label: "1")
                    FPButton(label: "2")
                    FPButton(label: "3")
                    FPButton(label: "@")
                }
                .frame(width: 75, height: 75)
                .background(Color.gray)
                .cornerRadius(5.0)
                GridRow {
                    FPButton(label: "0")
                        .frame(width: 75, height: 75)
                    FPButton(label: ".")
                        .frame(width: 75, height: 75)
                    FPButton(label: "Enter")
                        .gridCellColumns(2)
                        .frame(height: 75)
                }.background(Color.gray)
                    .cornerRadius(5.0)
            }.frame(width: (geo.size.width - 60))
        }
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        Keypad()
    }
}
