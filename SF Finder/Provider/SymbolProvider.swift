//
//  SymbolProvider.swift
//  SF Finder
//
//  Created by Mauricio Cardozo on 2/21/21.
//

import Foundation

protocol SymbolProvider {
    var symbols: [String] { get }
}

extension SymbolProvider {
    static func readSymbolFile(at resource: String) -> [String] {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "json") else {
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let file = try JSONDecoder().decode(SymbolFile.self, from: data)
            return file.symbols
        } catch {
            return []
        }
    }
}

struct SymbolFile: Codable {
    let symbols: [String]
}

/// A `SymbolProvider` implementation that has a list of SFSymbols for iOS13
final class ThirteenProvider: SymbolProvider {
    let symbols: [String] = ThirteenProvider.readSymbolFile(at: "thirteen")
}

/// A `SymbolProvider` implementation that has a list of SFSymbols for iOS14 and later
final class FourteenPlusProvider: SymbolProvider {
    let symbols: [String] = FourteenPlusProvider.readSymbolFile(at: "fourteen")
}


