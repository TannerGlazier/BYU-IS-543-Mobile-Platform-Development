//
//  ContentView.swift
//  NavigationDemo
//
//  Created by Stephen Liddle on 11/28/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                // A section of top-level abilities like browse all, search, favorites
                Section(header: Text("Top Level Actions")) {
                    NavigationLink {
                        browseAllList
                    } label: {
                        Text("Browse All")
                    }

                    NavigationLink {
                        Text("Search view")
                        // TODO: figure this out
                    } label: {
                        Text("Search")
                    }
                }

                // Categories
            }
        } content: {
            browseAllList
        } detail: {
            Text("Select an item")
        }
    }

    private var browseAllList: some View {
        List {
            ForEach(items) { item in
                NavigationLink {
                    Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                } label: {
                    Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                }
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), instructions: [])
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
