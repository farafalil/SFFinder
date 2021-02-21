//
//  AppDelegate.swift
//  SF Finder
//
//  Created by Hugo Anjos on 20/02/21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    #warning("TODO: Swap NSPopover implementation with NSView so we get that \"control center\" effect ")
    private var popover = NSPopover()
    private var statusBar: StatusBarController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = PopoverHostingController(popover: popover)

        popover.contentSize = NSSize(width: 300, height: 200)
        popover.contentViewController = contentView
        popover.behavior = .transient
        
        statusBar = StatusBarController(popover)
    }
}

// a bunch of dreams we didnt get to live up to
final class PopoverHostingController: NSHostingController<PopoverView> {

    weak var popover: NSPopover?

    init(popover: NSPopover) {
        super.init(rootView: PopoverView())
        self.popover = popover
        setupResizing()
    }

    @objc required dynamic init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupResizing() {
        rootView.shouldResize = { [weak self] height in
            guard let self = self else { return }
            self.popover?.contentSize = NSSize(width: 300, height: height)
        }
    }
}

