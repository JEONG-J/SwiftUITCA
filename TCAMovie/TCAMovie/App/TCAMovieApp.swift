//
//  TCAMovieApp.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAMovieApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(initialState: HomeFeature.State()) {
                    HomeFeature(environment: HomeEnvironment(movieService: MovieService()))
                }
            )
        }
    }
}
