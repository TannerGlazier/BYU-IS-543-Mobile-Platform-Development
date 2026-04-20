//
//  DeviceContext.swift
//  Recipes
//
//  Created by Stephen Liddle on 12/6/23.
//

import SwiftUI

// This enum helps me figure out which context we're in: iPad in landscape
// or portrait, Max/Plus phone in landscape, or anything else (other).  I use
// this to decide when to configure the NavigationSplitView in particular ways
// that make sense for the device context the user is in.

enum DeviceContext {
    case iPadLandscape, iPadPortrait, iPhoneMaxLandscape, other

    static func context(
        for size: CGSize,
        _ horizontalSizeClass: UserInterfaceSizeClass?,
        _ verticalSizeClass: UserInterfaceSizeClass?
    ) -> DeviceContext {
        if let horizontalSizeClass, horizontalSizeClass == .regular {
            if let verticalSizeClass, verticalSizeClass == .regular {
                size.width < size.height ? .iPadPortrait : .iPadLandscape
            } else {
                .iPhoneMaxLandscape
            }
        } else {
            .other
        }
    }
}
