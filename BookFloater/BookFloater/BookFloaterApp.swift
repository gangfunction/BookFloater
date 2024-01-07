
import Cocoa
import SwiftUI

// Main entry point for the SwiftUI application
//@main
//struct BookFloaterApp: App {
//    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate = AppDelegate()
//
//    
////    var body: some Scene {
////        EmptyView().frame(width: 0, height: 0)
//////        WindowGroup {
//////            IconGridView(appDelegate: appDelegateTarget)
//////        }
////    }
//}

// A view to display a grid of icons
struct IconGridView: View {
    // Reference to AppDelegate
    var appDelegate: AppDelegate

    // Icons array - replace these with actual icon names from your assets
    private let icons = ["icon1", "icon2", "icon3", "icon4", "icon5", "icon6"]
    // Define the number of columns for the grid
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(icons, id: \.self) { icon in
                    Button(action: {
                        // Example action: print window dimensions
                        print("Window dimensions: \(appDelegate.window.frame.size)")
                    }) {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.2))
        .frame(width: 200, height: 300)
    }
}
@main
// AppDelegate to set up the main window of the application
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = IconGridView(appDelegate: self)

        // Create and configure the main window
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 200, height: 300),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.standardWindowButton(.miniaturizeButton)?.isHidden = true
        window.standardWindowButton(.zoomButton)?.isHidden = true
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
}

// Preview provider for SwiftUI previews in Xcode
struct IconGridView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a dummy instance of AppDelegate for previews
        IconGridView(appDelegate: AppDelegate())
    }
}
