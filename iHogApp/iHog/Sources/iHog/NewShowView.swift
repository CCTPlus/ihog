// NewShowView.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import ComposableArchitecture
import DataStore
import Foundation
import SFSafeSymbols
import SwiftUI

public struct NewShowView: View {
    let store: StoreOf<iHog>

    public init(store: StoreOf<iHog>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    HStack {
                        Button {
                            viewStore.send(.changeIconButtonTapped)
                        } label: {
                            Image(systemSymbol: SFSymbol(rawValue: viewStore.selectedIcon))
                        }
                        .frame(width: 40, height: 40)
                        TextField("Show Name", text: viewStore.binding(\.$showName))
                            .textFieldStyle(.roundedBorder)
                    }
                    .onAppear {
                        viewStore.send(.onAppear)
                    }
                    .padding(.horizontal)
                    /// MARK: Category ScrollView
                    if viewStore.state.iconSelectorShown {
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(viewStore.categories, id: \.key) { cat in
                                        Button {
                                            viewStore.send(.selectCategory(cat.key))
                                        } label: {
                                            Image(systemName: cat.icon)
                                                .symbolVariant(
                                                    viewStore.selectedCategory == cat.key
                                                        ? .fill : .none
                                                )
                                                .font(.title)
                                                .padding(.trailing)
                                        }
                                        .accessibilityLabel(Text(cat.label))
                                    }
                                }
                            }
                            .frame(maxHeight: 40)
                            .padding()
                            .background(Material.bar)
                            /// MARK: Icon ScrollView
                            ScrollView {
                                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                                    ForEach(
                                        viewStore.iconsInCategories[viewStore.selectedCategory]
                                            ?? [],
                                        id: \.self
                                    ) { symbol in
                                        Button {
                                            viewStore.send(.selectIcon(symbol))
                                        } label: {
                                            Image(systemName: symbol)
                                                .symbolVariant(
                                                    viewStore.selectedIcon == symbol ? .fill : .none
                                                )
                                                .font(.title)
                                                .padding(.trailing)
                                        }
                                        .accessibilityLabel(Text(symbol))
                                        .padding()
                                    }
                                }
                            }
                        }
                        .transition(.opacity)

                    } else {
                        Spacer()
                    }
                }
                .animation(.default, value: viewStore.state.iconSelectorShown)
                .toolbar {
                    ToolbarItem {
                        Button {
                            let show = Show(
                                name: viewStore.showName,
                                dateCreated: Date(),
                                dateLastModified: Date(),
                                icon: viewStore.selectedIcon,
                                note: ""
                            )
                            viewStore.send(.saveButtonTapped(show))
                        } label: {
                            Text("Save")
                        }

                    }
                }
                .toolbarRole(.navigationStack)
            }
        }
    }
}

struct NewShowView_Previews: PreviewProvider {
    static var previews: some View {
        NewShowView(store: Store(initialState: iHog.State(), reducer: iHog()))
    }
}
