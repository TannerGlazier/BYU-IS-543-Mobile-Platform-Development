//
//  ContentView.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var navigationContext = NavigationContext()
    
    var body: some View {
        ThreeColumnContentView()
            .environment(navigationContext)
    }
}
    
#Preview {
    ContentView()
        .modelContainer(try! ModelContainer.sample())
}
