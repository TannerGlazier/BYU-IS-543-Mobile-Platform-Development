/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The main app, which creates a scene that shows the content view and sets the
 model container for the app.
*/

import SwiftUI
import SwiftData

@main
struct SwiftDataAnimalsApp: App {
    var body: some Scene {
        WindowGroup() {
            ContentView()
        }
        .modelContainer(for: AnimalCategory.self)
        #if os(macOS)
        .commands {
            SidebarCommands()
        }
        #endif
    }
}
