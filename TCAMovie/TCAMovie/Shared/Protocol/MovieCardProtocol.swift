//
//  MovieCardProtocol.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import Foundation
import SwiftUI

protocol MovieCardProtocol {
    var movie: Movie { get }
    func clickCard()
    
    associatedtype ImageView: View
    @ViewBuilder var movieImage: ImageView { get }
}
