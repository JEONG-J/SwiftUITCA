//
//  MovieService.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import Foundation
import Moya
import Combine
import CombineMoya

class MovieService: MovieServiceProtocol {
    private let provider = MoyaProvider<MovieAPITarget>()
    
    func fetchMovies(list: Int, sortBy: String) async throws -> [Movie] {
        let response = try await request(.getMovieList(list: list, value: sortBy))
        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: response.data)
        return movieResponse.data.movies
    }
    
    private func request(_ target: MovieAPITarget) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    continuation.resume(returning: response)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
 
