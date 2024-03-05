//
//  MoviesService.swift
//  LearningUIKit
//
//  Created by Eric on 05/03/2024.
//

import Foundation

struct Movie: Codable, Equatable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    var posterURL: URL {
        URL(string: "https://image.tmdb.or/t/p/w400/\(posterPath)")!
    }
}

struct MovieResponse: Codable {
    let results: [Movie]
}

class MoviesService {
    func getMovies(_ completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            let decoded = try! jsonDecoder.decode(MovieResponse.self, from: data!)
            
            completion(.success(decoded))
        }
        .resume()
    }
}
