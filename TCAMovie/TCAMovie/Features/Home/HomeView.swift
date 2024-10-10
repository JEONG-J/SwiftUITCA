//
//  ContentView.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    let store: StoreOf<HomeFeature>
    
    var body: some View {
        WithViewStore(store,
                      observe: { $0 },
                      content: { viewStore in
            VStack() {
                topSection
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color.black)
            .onAppear {
                viewStore.send(.fetchMovies)
            }
        })
    }
    
    private var topTitle: some View {
        let text = "Top Five."
        var attributedString = AttributedString(text)
        
        if let range = attributedString.range(of: ".") {
            attributedString[range].foregroundColor = .yellow
        }
        
        return Text(attributedString)
            .font(.system(size: 30, weight: .bold))
            .foregroundStyle(Color.white)
    }
    
    private var topMovieList: some View {
        HStack(spacing: 1, content: {
            
            ForEach(store.movies, id: \.self) { movie in
                TopMovieCard(movie: movie)
            }
            
            Text("hello")
                .foregroundStyle(.white)
        })
        .border(Color.red, width: 2)
    }
    
    private var topSection: some View {
        VStack(alignment: .leading, spacing: 20 , content: {
            topTitle
            topMovieList
        })
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView(
            store: Store(initialState: HomeFeature.State()) {
                HomeFeature(environment: HomeEnvironment(movieService: MovieService()))
            }
        )
    }
}
