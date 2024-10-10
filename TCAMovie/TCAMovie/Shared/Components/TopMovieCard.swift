//
//  MovieCard.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import SwiftUI
import Kingfisher

struct TopMovieCard: View, MovieCardProtocol {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12, content: {
            movieCard
            movieTitle
        })
        .background(Color.clear)
    }
    
    @ViewBuilder
    var movieImage: some View {
        if let url = URL(string: movie.mediumCoverImage) {
            KFImage(url)
                .placeholder {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                .resizable()
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .task {
                    clickCard()
                }
        }
    }
    
    private var movieCard: some View {
        ZStack(alignment: .topTrailing) {
            movieImage
            
            Icon.tag.image
                .fixedSize()
                .padding([.top, .trailing], 10)
        }
    }
    
    private var movieTitle: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(movie.title)
                .font(.title)
                .foregroundStyle(Color.white)
            
            Text(String(movie.rating))
                .font(Font.system(size: 22, weight: .bold))
                .foregroundStyle(Color.white)
            
        })
    }
    
    func clickCard() {
        print("hello")
    }
}

struct TopMovieCard_PreView: PreviewProvider {
    static var previews: some View {
        TopMovieCard(movie: Movie(id: 1, url: "sdas", imdbCode: "asdasd", title: "Azrael", titleEnglish: "Azrael", titleLong: "Azrael", slug: "Azrael", year: 1232, rating: 5.2, runtime: 12, genres: ["Azrael"], summary: "The world's most lethal odd couple - bodyguard Michael Bryce and hitman Darius Kincaid - are back on anoth......", descriptionFull: "Azrael", synopsis: "Azrael", ytTrailerCode: "Azrael", language: "Azrael", mpaRating: "Azrael", backgroundImage: "Azrael", backgroundImageOriginal: "Azrael", smallCoverImage: "Azrael", mediumCoverImage: "https://yts.mx/assets/images/movies/azrael_2024/medium-cover.jpg", largeCoverImage: "asdad", state: "Azrael", torrents: [Torrent(url: "1234", hash: "1234", quality: "1234", type: "1234", isRepack: "1234", videoCodec: "1234", bitDepth: "1234", audioChannels: "1234", seeds: 1, peers: 1, size: "1234", sizeBytes: 1, dateUploaded: "1234", dateUploadedUnix: 1)], dateUploaded: "1234", dateUploadedUnix: 1))
            .previewLayout(.sizeThatFits)
    }
}
