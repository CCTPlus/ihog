// PuntPageProg.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import ComposableArchitecture
import Frontpanel
import SFSafeSymbols
import SwiftUI

struct PuntPageProg: View {
    let store: StoreOf<ShowStore>

    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 1) {
                        HStack(spacing: 1) {
                            FPButton(label: "High\nLight")
                                .background(Color.gray)
                            FPButton(label: "Blind")
                                .background(Color.gray)
                            FPButton(label: "Clear")
                                .background(Color.gray)
                        }.aspectRatio(3/1, contentMode: .fit)
                        HStack(spacing: 1) {
                            FPButton(label: "Back")
                                .background(Color.gray)
                            FPButton(label: "All")
                                .background(Color.gray)
                            FPButton(label: "Next")
                                .background(Color.gray)
                        }.aspectRatio(3/1, contentMode: .fit)
                        HStack(spacing: 1) {
                            FPButton(
                                label: "",
                                icon: Image(systemSymbol: .dialHigh)
                            )
                            .background(Color.gray)
                            FPButton(
                                label: "",
                                icon: Image(systemSymbol: .rectangle3Group)
                            )
                            .background(Color.gray)
                            FPButton(
                                label: "",
                                icon: Image(systemSymbol: .squareGrid3x1BelowLineGrid1x2)
                            )
                            .background(Color.gray)
                        }.aspectRatio(3/0.5, contentMode: .fit)
                    }

                }
                Spacer()
                ObjectsView(store: store)
                    .padding(.vertical)
                    .frame(height: geo.size.height * 0.5)
            }.toolbar {
                ToolbarItem {
                    Button {
                        print("keypad")
                    } label: {
                        Image(systemSymbol: .squareGrid3x3)
                    }

                }
            }
        }
    }
}

struct PuntPageProg_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PuntPageProg(
                store: Store(
                    initialState: ShowStore.State(
                        show: TestShowStore.show,
                        tab: .objects
                    ),
                    reducer: ShowStore()
                )
            )
        }
    }
}
