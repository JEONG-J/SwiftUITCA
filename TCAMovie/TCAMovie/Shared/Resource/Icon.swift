//
//  Icon.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import Foundation
import SwiftUI

enum Icon: String {
    
    // MARK: Tab
    case home = "Home"
    case glass = "Glass"
    case tag = "Tag"
    
    case clickedTag = "ClickedTag"
    case clickedHome = "ClickedHome"
    case clickedGlass = "ClickedGlass"

    var image: Image {
        return Image(self.rawValue)
    }
}
