//
//  ContentView.swift
//  SF Finder
//
//  Created by Hugo Anjos on 20/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputSearch = ""
    private var symbols = ["pencil", "scribble", "pencil.tip"]
    
    struct Symbol: View {
        var name: String

        var body: some View {
            Button(action: {
                let pasteboard = NSPasteboard.general
                pasteboard.clearContents()
                pasteboard.setString(name, forType: .string)
            }) {
                VStack {
                    if #available(OSX 11.0, *) {
                        Image(systemName: name)
                    } else {
                        // Fallback on earlier versions
                    }
                    Text(name)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Section {
                TextField("Search", text: $inputSearch)
            }
            .padding(.all, 10.0)
            
            Section {
                ForEach(symbols, id: \.self) { symbol in
                    Symbol(name: symbol)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
