//
//  HomeFeature.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import Foundation
import ComposableArchitecture
import Combine

@Reducer
struct HomeFeature {
    
    let environment: HomeEnvironment
    
    @ObservableState
    struct State: Equatable {
        var movies: [Movie] = []
        var isLoading: Bool = false
        var errorMessage: String?
    }
    
    enum Action: Equatable {
        case fetchMovies
        case fetchMoviesResponse(Result<[Movie], MovieServiceError>)
    }
    
    // TODO: - 수정 사항
    var body: some Reducer<State, Action> {
        Reduce { state, action in 
            switch action {
            case .fetchMovies:
                state.isLoading = true
                state.errorMessage = nil
                return .run { send in
                    do {
                        let movies = try await environment.movieService.fetchMovies(list: 10, sortBy: "rating")
                        await send(.fetchMoviesResponse(.success(movies)))
                        print("영화 받아옴")
                    } catch {
                        await send(.fetchMoviesResponse(.failure(.networkError(error.localizedDescription))))
                    }
                }
                
            case let .fetchMoviesResponse(.success(movies)):
                state.isLoading = false
                state.movies = movies
                return .none
                
            case let .fetchMoviesResponse(.failure(error)):
                state.isLoading = false
                state.errorMessage = error.description
                return .none
            }
        }
    }
}

enum MovieServiceError: Equatable, Error {
    case networkError(String)
    var description: String {
        switch self {
        case let .networkError(message):
            return message
        }
    }
}
