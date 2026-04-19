//
//  TitleView.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
//

import SwiftUI

struct TitleView: View {
    @ObservedObject var viewModel = TitleViewModel()

    var body: some View {
        VStack {
            TextField("Enter Title", text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                viewModel.saveTitle()
            }
            .padding()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
