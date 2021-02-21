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
        TextField("Search Symbol...", text: $inputSearch)
            .padding(9)
            .cornerRadius(8)
            .textFieldStyle(PlainTextFieldStyle())
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.black.opacity(0.1))
                    .padding(5)
                    
            )
            .overlay(
                Button(action: {
                    self.inputSearch = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                }
                .opacity(self.inputSearch.count == 0 ? 0 : 1)
                .padding(8)
                .buttonStyle(PlainButtonStyle())
                .animation(.default)
                ,alignment: .trailing
            )
               
        
    }
}
