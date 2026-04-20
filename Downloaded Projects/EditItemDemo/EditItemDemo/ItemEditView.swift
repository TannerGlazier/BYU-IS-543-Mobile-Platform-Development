//
//  ItemEditView.swift
//  EditItemDemo
//
//  Created by Stephen Liddle on 12/12/23.
//

import SwiftUI

struct ItemEditView: View {
    @Environment(\.dismiss) private var dismiss

    let item: Item?

    @State private var itemDate: Date = .now

    init(item: Item?) {
        self.item = item
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Item Stuff")) {
                    DatePicker("Timestamp", selection: $itemDate)
                }
            }
            .navigationTitle(formTitle)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        // NEEDSWORK: save it
                        if let item {
                            // To edit an existing item, just copy the field and it
                            // is supposed to auto-save.
                            item.timestamp = itemDate
                            // You still might need to run "try? modelContext.save()"
                        } else {
                            // NEEDSWORK: create a new Item with the given timestamp
                        }
                        dismiss()
                    }, label: {
                        Text("Save")
                    })
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
            }
        }
        .onAppear {
            // This initialization needs to happen here, not in the init()
            // method.  Somehow the default assignment of itemDate: Date = .now
            // overrides what happens in init().
            if let item {
                itemDate = item.timestamp
            }
        }
    }

    private var formTitle: String {
        item == nil ? "New Item" : "Edit Item"
    }
}

#Preview {
    ItemEditView(item: nil)
}
