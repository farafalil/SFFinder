//
//  PopoverView.swift
//  SF Finder
//
//  Created by Mauricio Cardozo on 2/21/21.
//

import Foundation
import SwiftUI
import Combine

// This should be the view that holds both the search and IconGridView
// It should know how to resize itself when there are multiple Icons and hold the ScrollView as well

final class PopoverViewModel: ObservableObject {

    private var cancellables: Set<AnyCancellable> = []
    @Published var searchedSymbols: [String] = []
    @Published var searchInput: String = ""
    let provider: SymbolProvider = FourteenPlusProvider()

    init() {
        setupPublishers()
    }

    func setupPublishers() {
        $searchInput
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] in
                self?.searchedSymbols = self?.searchSymbols(for: $0) ?? []
            }
            .store(in: &cancellables)
    }

    func searchSymbols(for input: String) -> [String] {
        guard input.isEmpty == false else { return [] }

        return provider.symbols.filter {
            $0.range(of: input, options: .caseInsensitive) != nil
        }
    }
}

struct PopoverView: View {

    @StateObject var viewModel: PopoverViewModel = .init()

    var shouldResize: ((CGFloat) -> Void)?

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                SearchBarView(inputSearch: $viewModel.searchInput)
                    .padding(.vertical, 4)
                if !viewModel.searchedSymbols.isEmpty {
                    IconGridView(symbols: $viewModel.searchedSymbols)
                }
            }
        }
//        .onReceive(viewModel.$searchedSymbols, perform: { symbols in
//            self.shouldResize?(symbols.isEmpty ? 300 : 700)
//        })
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
