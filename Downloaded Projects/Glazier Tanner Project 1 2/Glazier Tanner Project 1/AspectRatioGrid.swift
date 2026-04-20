//
//  AspectScrollVGrid.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/25/23.
//

import SwiftUI

struct AspectRatioGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
        
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Calculate the width that fits the items based on aspect ratio.
                let width:CGFloat = widthThatFits(itemsCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
                // Create a lazyVGrid with adaptive columns and item aspect ratio.
                LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                    ForEach(items) { item in
                        content(item)
                            .aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    // Create an adaptive grid item with specified minimum width.
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    // Calculate the width that fits the items based on aspect ratio and available size.
    private func widthThatFits(itemsCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemsCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / CGFloat(aspectRatio)
            if itemHeight * CGFloat(rowCount) < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemsCount + (columnCount - 1)) / columnCount
        } while columnCount < itemsCount
        if columnCount > itemsCount {
            columnCount = itemsCount
        }
        
        return floor(size.width / CGFloat(columnCount))
    }
}

