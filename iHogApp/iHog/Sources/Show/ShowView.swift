// ShowView.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import ComposableArchitecture
import SFSafeSymbols

import SwiftUI

public struct ShowView: View {
    var store: StoreOf<ShowStore>

    public init(store: StoreOf<ShowStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView {
                Text("Programming Objects")
                    .tabItem {
                        Image(systemSymbol: .grid)
                        Text("Programming")
                    }
                Text("Playback Objects")
                    .tabItem {
                        Image(systemSymbol: .play)
                        Text("Playback")
                    }
            }
            .navigationTitle(viewStore.selectedShow?.name ?? "No name found")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShowView(
                store:
                    Store(
                        initialState: ShowStore.State(show: TestShowStore.show),
                        reducer: ShowStore()
                    )
            )
        }
    }
}
