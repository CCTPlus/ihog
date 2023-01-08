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
        GridItem(.fixed(100.0), spacing: 10.0, alignment: .center),
        GridItem(.fixed(100.0), spacing: 10.0, alignment: .center)
    ]

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewStore.selectedShow?.objects ?? []) { obj in
                        VStack {
                            HStack {
                                Text("\(obj.objType.rawValue.capitalized) \(obj.number.removeZerosFromEnd())")
                                Spacer()
                                Button {
                                    viewStore.send(.menuButtonObjectTapped)
                                } label: {
                                    Image(systemSymbol: .ellipsisBubble)
                                }

                            }
                            Text(obj.name)
                            HStack {
                                Button {
                                    viewStore.send(.playButtonTapped(obj.number))
                                } label: {
                                    Image(systemSymbol: .playFill)
                                }
                                .foregroundColor(.primary)
                                Button {
                                    viewStore.send(.playButtonTapped(obj.number))
                                } label: {
                                    Image(systemSymbol: .stopFill)
                                }
                                .foregroundColor(.primary)

                            }
                            .padding()
                        }
                        .background(obj.color)
                    }
                }
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
