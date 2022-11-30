// NewShowView.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import SFSafeSymbols
import Foundation
import SwiftUI

public struct NewShowView: View {
    @StateObject private var symbolHelper = SymbolHelper()
    @State private var selectedCategory = ""
    @State private var selectedIcon = "folder"

    public init() {}

    public var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        print("change icon")
                    } label: {
                        Image(systemSymbol: SFSymbol(rawValue: selectedIcon))
                    }.frame(width: 40, height: 40)
                    TextField("Show Name", text: .constant("New show"))
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal)
                .task {
                    await symbolHelper.setSymbolsInCategories()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(symbolHelper.categories, id: \.key) { cat in
                            Button {
                                selectedCategory = cat.key
                            } label: {
                                Image(systemName: cat.icon)
                                    .symbolVariant(selectedCategory == cat.key ? .fill : .none)
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
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(
                            symbolHelper.symbolsInCateogries[selectedCategory] ?? [],
                            id: \.self
                        ) { symbol in
                            Button {
                                selectedIcon = symbol
                            } label: {
                                Image(systemName: symbol)
                                    .symbolVariant(selectedIcon == symbol ? .fill : .none)
                                    .font(.title)
                                    .padding(.trailing)
                            }
                            .accessibilityLabel(Text(symbol))
                            .padding()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        print("save")
                    } label: {
                        Text("Save")
                    }

                }
            }
            .toolbarRole(.navigationStack)
        }
    }
}

struct NewShowView_Previews: PreviewProvider {
    static var previews: some View {
        NewShowView()
    }
}
