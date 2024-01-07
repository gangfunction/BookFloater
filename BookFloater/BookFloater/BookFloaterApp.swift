//
//  BookFloaterApp.swift
//  BookFloater
//
//  Created by 이강주 on 1/7/24.
//
import Cocoa
import SwiftUI

@main
struct BookFloaterApp: App {
    var body: some Scene {
        WindowGroup {
            IconGridView()
        }
    }
}

struct IconGridView: View {
    // Assuming you have icons named "icon1", "icon2", etc. in your assets
    private let icons = ["icon1", "icon2", "icon3", "icon4", "icon5", "icon6"]
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing:30 ) {
                ForEach(icons, id: \.self) { icon in
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .background(Color.white)
                        .cornerRadius(10) // Gently rounded corners
                        .shadow(radius: 5) // Optional shadow for a subtle effect
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.2)) // Background of the entire grid view
        .cornerRadius(0) // Rounded corners for the entire grid view
        .frame(minWidth:200, maxWidth:200)
        .frame(minHeight:300, maxHeight:300)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = IconGridView()

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 400),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.setContentSize(NSSize(width: 300, height: 400)) // Fix the window size
    }
}


struct IconGridView_Previews: PreviewProvider {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
         WindowGroup {
             IconGridView()
         }
     }
}


