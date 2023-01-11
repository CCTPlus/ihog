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
            TabView(selection: viewStore.binding(\.$selectedTab)) {
                ObjectsView(store: store)
                    .tabItem {
                        Image(systemSymbol: .listClipboard)
                        Text("Objects")
                    }
                    .tag(ShowStore.Destination.objects)
                Text("Favorites")
                    .tabItem {
                        Image(systemSymbol: .heart)
                        Text("Favorites")
                    }
                    .tag(ShowStore.Destination.favorites)
                Text("Punt")
                    .tabItem {
                        Image(systemSymbol: .cpu)
                        Text("Punt")
                    }
                    .tag(ShowStore.Destination.punt)
                Text("Settings")
                    .tabItem {
                        Image(systemSymbol: .gearshape2)
                        Text("Settings")
                    }
                    .tag(ShowStore.Destination.settings)
            }
            .navigationTitle(viewStore.selectedShow?.name ?? "No name found")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ShowView_Previews: PreviewProvider {
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
