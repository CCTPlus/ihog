// SymbolHelper.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct Category: Codable, Equatable {
    var icon: String
    var key: String
    var label: String
}

struct CategoryWithSymbols {
    var icon: String
    var key: String
    var label: String
    var icons: [String]
}

public class SymbolHelper: ObservableObject {
    let categoryFile = Bundle.module.url(forResource: "categories", withExtension: "plist")
    let symbolsFile = Bundle.module.url(forResource: "symbol_categories", withExtension: "plist")

    var categories: [Category] = []
    @Published public var symbolsInCateogries: [String: [String]] = [:]

    public func sortSymbolsIntoCategories() -> [String: [String]] {
        let symbols = getSymbolsInCategories()

        for symbol in symbols {
            for category in symbol.value {
                if !symbol.key.contains("fill") {
                    if symbolsInCateogries[category] != nil {
                        symbolsInCateogries[category]!.append(symbol.key)
                        symbolsInCateogries[category]!.sort()
                    } else {
                        symbolsInCateogries[category] = [symbol.key]
                    }
                }
            }
        }

        return symbolsInCateogries
    }

    func getCategoies() -> [Category] {
        do {
            let data = try Data(contentsOf: categoryFile!)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Array<Category>.self, from: data)
        } catch {
            print(error)
            return []
        }
    }

    func getSymbolsInCategories() -> [String: [String]] {
        do {
            let data = try Data(contentsOf: symbolsFile!)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Dictionary.self, from: data)
        } catch {
            print(error)
            return [:]
        }
    }
}
