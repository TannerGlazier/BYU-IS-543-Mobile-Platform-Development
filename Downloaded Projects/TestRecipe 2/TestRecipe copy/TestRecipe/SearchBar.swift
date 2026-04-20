//
//  SearchBar.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/14/23.
//

// SearchBar.swift

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search recipes", text: $searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.trailing, 8)

            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(8)
            }
            .opacity(searchText.isEmpty ? 0 : 1)
        }
        .padding(.horizontal)
    }
}
