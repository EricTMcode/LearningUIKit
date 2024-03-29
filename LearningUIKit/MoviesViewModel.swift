//
//  MoviesViewModel.swift
//  LearningUIKit
//
//  Created by Eric on 05/03/2024.
//

import Foundation

class MoviesViewModel {
    
    let movies = Variable<[Movie]>([])
    
    private let service = MoviesService()
    
    func fetchData() {
        service.getMovies { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies.value = response.results
            case .failure:
                break
            }
        }
    }
}
