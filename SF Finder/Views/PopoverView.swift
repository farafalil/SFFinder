//
//  PopoverView.swift
//  SF Finder
//
//  Created by Mauricio Cardozo on 2/21/21.
//

import Foundation
import SwiftUI

// This should be the view that holds both the search and IconGridView
// It should know how to resize itself when there are multiple Icons and hold the ScrollView as well

final class PopoverViewModel: ObservableObject {
    @Published var searchedSymbols: [String] = []
}

struct PopoverView: View {

    @StateObject var viewModel: PopoverViewModel = .init()

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                Text("input textfield goes here")
                if viewModel.searchedSymbols.isEmpty {
                    Text("empty state view goes here")
                } else {
                    IconGridView(symbols: $viewModel.searchedSymbols)
                }
            }
        }
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
