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
        // Create the SwiftUI view that provides the window contents.
        let contentView = PopoverView()

        popover.contentSize = NSSize(width: 320, height: 360)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        statusBar = StatusBarController(popover)
    }
}
