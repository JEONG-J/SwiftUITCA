//
//  BottomMovieCard.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import SwiftUI
import Kingfisher

struct BottomMovieCard: View, MovieCardProtocol {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        HStack(spacing: 18, content: {
            movieCard
            
            movieInfo
        })
        .task {
            self.clickCard()
        }
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
                .frame(width: 182, height: 273)
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
    
    private var movieInfo: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(movie.title)
                .font(.title)
                .foregroundStyle(Color.white)
                .frame(maxWidth: 163, alignment: .leading)
                .lineLimit(2)
            
            Text(String(movie.rating))
                .font(.title)
                .foregroundStyle(Color.white)
            
            Text(movie.summary)
                .font(.caption)
                .foregroundStyle(Color.textDescrip)
                .frame(maxWidth: 180, maxHeight: 141, alignment: .topLeading)
        })
    }

    func clickCard() {
        print("hello")
    }
}

struct BottomMovieCard_PreView: PreviewProvider {
    static var previews: some View {
        BottomMovieCard(movie: Movie(id: 1, url: "sdas", imdbCode: "asdasd", title: "Azrael", titleEnglish: "Azrael", titleLong: "Azrael", slug: "Azrael", year: 1232, rating: 5.2, runtime: 12, genres: ["Azrael"], summary: "The world's most lethal odd couple - bodyguard Michael Bryce and hitman Darius Kincaid - are back on anoth......", descriptionFull: "Azrael", synopsis: "Azrael", ytTrailerCode: "Azrael", language: "Azrael", mpaRating: "Azrael", backgroundImage: "Azrael", backgroundImageOriginal: "Azrael", smallCoverImage: "Azrael", mediumCoverImage: "https://yts.mx/assets/images/movies/azrael_2024/medium-cover.jpg", largeCoverImage: "asdad", state: "Azrael", torrents: [Torrent(url: "1234", hash: "1234", quality: "1234", type: "1234", isRepack: "1234", videoCodec: "1234", bitDepth: "1234", audioChannels: "1234", seeds: 1, peers: 1, size: "1234", sizeBytes: 1, dateUploaded: "1234", dateUploadedUnix: 1)], dateUploaded: "1234", dateUploadedUnix: 1))
            .previewLayout(.sizeThatFits)
    }
}
