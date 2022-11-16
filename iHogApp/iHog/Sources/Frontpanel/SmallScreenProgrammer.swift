// SmallScreenProgrammer.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SFSafeSymbols
import SwiftUI

struct SmallScreenProgrammer: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                Text("Command line text goes here.... It is really long and drawn out").lineLimit(2)
                    .padding()
                ScrollView {
                    VStack(alignment: .center) {
                        HStack(spacing: 1) {
                            FPButton(label: "High\nLight")
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/4
                                )
                                .background(Color.gray)
                            FPButton(label: "Blind")
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/4
                                )
                                .background(Color.gray)
                            FPButton(label: "Clear")
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/4
                                )
                                .background(Color.gray)
                        }
                        HStack(spacing: 1) {
                            FPButton(
                                label: "",
                                icon: Image(systemSymbol: .dialHigh)
                            )
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/6
                                )
                                .background(Color.gray)
                            FPButton(
                                label: "",
                                icon: Image(systemSymbol: .rectangle3Group)
                            )
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/6
                                )
                                .background(Color.gray)
                            FPButton(
                                label: "",
                                icon: Image(systemSymbol: .squareGrid3x3)
                            )
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/6
                                )
                                .background(Color.gray)
                        }
                        HStack(spacing: 1) {
                            FPButton(label: "Back")
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/4
                                )
                                .background(Color.gray)
                            FPButton(label: "All")
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/4
                                )
                                .background(Color.gray)
                            FPButton(label: "Next")
                                .frame(
                                    width: geo.size.width/4,
                                    height: geo.size.width/4
                                )
                                .background(Color.gray)
                        }
                    }
                }
                .frame(height: geo.size.height - 50 - (((geo.size.width-3)/4)*5))
                Keypad()
                    .frame(height: ((geo.size.width-3)/4)*5)
            }
        }
    }
}

struct SmallScreenProgrammer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SmallScreenProgrammer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            print("HElLLO")
                        } label: {
                            Image(systemSymbol: .chevronLeft)
                        }

                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
