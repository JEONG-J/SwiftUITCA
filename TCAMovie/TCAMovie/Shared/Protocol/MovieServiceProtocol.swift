//
//  MovieServiceProtocol.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(list: Int, sortBy: String) async throws -> [Movie]
}
