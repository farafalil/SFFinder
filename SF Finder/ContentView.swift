//
//  ContentView.swift
//  SF Finder
//
//  Created by Hugo Anjos on 20/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputSearch = ""
    private var symbols = symbolNames

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Section {
                    TextField("Search", text: $inputSearch)
                }
                .padding(.all)

                Section {
                    // we should have a different section for when $inputSearch.isEmpty
                    LazyVGrid(columns: gridLayout, spacing: 10) {
                        ForEach(symbols, id: \.self) { symbol in
                            IconView(systemName: symbol)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    var gridLayout: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 5)
    ]
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let symbolNames = ["pencil",
                   "arrow.left",
                   "scribble",
                   "pencil.tip",
                   "square.and.pencil",
                   "trash.fill",
                   "folder.fill.badge.plus"]
