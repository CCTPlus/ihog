// ObjectsView.swift
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
import Utilities

struct ObjectsView: View {
    let store: StoreOf<ShowStore>
    let columns = [
        GridItem(.flexible(), spacing: 10.0, alignment: .center),
        GridItem(.flexible(), spacing: 10.0, alignment: .center),
    ]

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geo in
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewStore.selectedShow?.objects ?? []) { obj in
                            ObjectView(
                                width: geo.size.width * 0.30,
                                object: obj
                            )
                        }
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
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
