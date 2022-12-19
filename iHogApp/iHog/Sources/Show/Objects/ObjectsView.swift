// ObjectsView.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import ComposableArchitecture
import Utilities
import SwiftUI

struct ObjectsView: View {
    let store: StoreOf<ShowStore>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                Text("List of objects")
            }
            .toolbarRole(.navigationStack)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("Hello")
                    } label: {
                        Image(systemSymbol: .squareGrid2x2)
                    }
                    Menu {
                        ForEach(ObjectType.allCases, id: \.self) { objType in
                            Button {
                                viewStore.send(.addObjectTapped(objType))
                            } label: {
                                Text(objType.rawValue.capitalized)
                            }

                        }

                    } label: {
                        Image(systemSymbol: .plus)
                    }
                }
            }
        }
    }
}

struct ObjectsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShowView(
                store: Store(
                    initialState: ShowStore.State(show: TestShowStore.show, tab: .objects),
                    reducer: ShowStore()
                )
            )
        }
    }
}
