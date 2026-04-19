//
//  OpenSkyUtahApp.swift
//  OpenSkyUtah
//
//  Created by Stephen Liddle on 10/26/23.
//

import SwiftUI

@main
struct OpenSkyUtahApp: App {
    var body: some Scene {
        WindowGroup {
            OpenSkyUtahView(openSkyService: OpenSkyService())
        }
    }
}
