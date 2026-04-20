//
//  ContentView.swift
//  TwoListDemo
//
//  Created by Stephen Liddle on 11/30/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Query private var items2: [Item2]

    var body: some View {
        NavigationSplitView {
            TabView {
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
                .tabItem {
                    Label("Items", image: "list.bullet")
                }

                List {
                    ForEach(items2) { item in
                        NavigationLink {
                            Text("Item2 at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        } label: {
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .tabItem {
                    Label("Items2", image: "list.star")
                }
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
                ToolbarItem {
                    Button(action: addItem2) {
                        Label("Add Item2", systemImage: "square.and.arrow.down.fill")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), title: "Some Title")
            modelContext.insert(newItem)
        }
    }

    private func addItem2() {
        withAnimation {
            let newItem2 = Item2(timestamp: Date())
            modelContext.insert(newItem2)
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
