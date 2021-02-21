//
//  IconGridView.swift
//  SF Finder
//
//  Created by Mauricio Cardozo on 2/21/21.
//

import Foundation
import SwiftUI

struct IconGridView: View {

    @Binding var symbols: [String]

    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 10) {
            ForEach(symbols, id: \.self) { symbol in
                IconView(systemName: symbol)
            }
        }
    }

    #warning("""
    TODO: find out a way to make icons width bigger by multiplying a
        base width in whole steps instead of adapting themselves to whatever width they want to

        i.e.:
        [grid item 100] [grid item 100] [grid item 100]
        [        grid item 200        ] [grid item 100]

        instead of

        [grid item 100] [grid item 100] [grid item 100]
        [    grid item 150    ] [grid item 100]
        [grid item 100] [  grid item 127   ] [grid it]
    """)
    var gridLayout: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 5)
    ]
}

struct IconGridView_Previews: PreviewProvider {

    static let symbolNames = ["pencil",
                              "arrow.left",
                              "scribble",
                              "pencil.tip",
                              "square.and.pencil",
                              "trash.fill",
                              "folder.fill.badge.plus"]

    static var previews: some View {
        IconGridView(symbols: .constant(symbolNames))
    }

}
