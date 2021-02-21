//
//  IconView.swift
//  SF Finder
//
//  Created by Mauricio Cardozo on 2/21/21.
//

import Foundation
import SwiftUI

// doing it this way means our icons will all have "copied" if we try to copy more than one
// (not cool btw)
final class IconViewViewModel: ObservableObject {

    init(iconName: String) {
        self.iconName = iconName
        self.image = Image(systemName: iconName)
    }

    @Published var iconName: String
    @Published var image: Image

    func didTapIcon() {
        // do pasteboard
        setPasteboard(to: iconName)
        // change name to copied
        iconName = "Copied!"
        // maybe change icon as well?
    }

    private func setPasteboard(to string: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(string, forType: .string)
    }
}

struct IconView: View {

    @StateObject var viewModel: IconViewViewModel

    init(systemName: String) {
        _viewModel = StateObject(wrappedValue: IconViewViewModel(iconName: systemName))
    }

    var body: some View {
        VStack(spacing: 20) {
            viewModel.image
            Text(viewModel.iconName)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                .fill(Color.gray.opacity(0.2))
        )
        .onTapGesture {
            viewModel.didTapIcon()
        }

    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            IconView(systemName: "arrow.left")
            IconView(systemName: "folder.fill.badge.plus")
        }
        .padding()
    }
}

