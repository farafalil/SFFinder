//
//  SearchBarView.swift
//  SF Finder
//
//  Created by Hugo Anjos on 21/02/21.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    @Binding var inputSearch: String
    
    var body: some View {
        HStack {
            TextField("Search Symbol...", text: $inputSearch)
                .padding(8)
                .cornerRadius(8)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(
                    Button(action: {
                        self.inputSearch = ""
                    }) {
                        Text("Clear")
                    }
                    .padding(8)
                    .disabled(self.inputSearch.count == 0)
                    , alignment: .trailing)
        }
    }
}
