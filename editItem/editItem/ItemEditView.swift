//
//  ItemEditView.swift
//  editItem
//
//  Created by Tanner Glazier on 12/12/23.
//

import SwiftUI

struct ItemEditView: View {
    @Environment(\.dismiss) private var dismiss
    
    let item: Item?
    
    @State private var itemDate: Date = .now
    
    init(item: Item?) {
        self.item = item
        
        if let item {
            itemDate = item.timestamp
        }
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
                        // save it
                        dismiss()
                    }, label: {
                     Text("Save")
                    })
                }
                ToolbarItem(placement: .cancellationAction){
                    Button(action: {
                        
                    }, label: {
                        Text()
                    }
                })
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
