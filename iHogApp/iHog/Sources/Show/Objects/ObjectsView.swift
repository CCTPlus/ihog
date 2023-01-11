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
        GridItem(.flexible(), spacing: 10.0, alignment: .center)
    ]

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewStore.objects) { obj in
                        ObjectView(object: obj)
                    }
                }.padding(.horizontal)
            }
            .toolbarRole(.navigationStack)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        ForEach(ObjectType.allCases, id: \.self) { objType in
                            Button {
                                viewStore.send(.filterButtonTapped(objType))
                            } label: {
                                Text(objType.rawValue.capitalized)
                                Spacer()
                                if viewStore.objectFilter[objType] ?? false {
                                    Image(systemSymbol: .checkmark)
                                }
                            }

                        }

                    } label: {
                        Image(systemSymbol: .line3HorizontalDecreaseCircle)
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
