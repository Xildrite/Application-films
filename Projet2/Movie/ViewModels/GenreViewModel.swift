//
//  GenreViewModel.swift
//  Projet2
//
//  Created by Baptiste Taviot on 19/04/2022.
//


//Recuperer les données depuis l'API de façon Asynchrone 


import Foundation
import WebKit
import Combine

class GenreViewModel: ObservableObject {
    @Published var genres: [Genre] = []
    
    private var task: AnyCancellable?
    
    private var tryFetchGenres: Int = 0
    func fetchGenres(completion: @escaping()->()) {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: ApiViewModel.genreUrl)!)
            .map { return $0.data; }
            .decode(type: GenreResponse.self, decoder: JSONDecoder())
            .replaceError(with: GenreResponse(genres: []))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .map { return $0.genres as [Genre] }
            .sink {
                if($0.isEmpty && self.tryFetchGenres < 3) {
                    self.task?.cancel()
                    self.tryFetchGenres += 1
                    self.fetchGenres(){
                        
                    }
                    return
                } else {
                    self.genres = $0
                    completion()
                }
            }
    }
    
    func fetchAllGenres(completion: @escaping () -> ()) {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: ApiViewModel.genreUrl)!)
            .map { return $0.data; }
            .decode(type: GenreResponse.self, decoder: JSONDecoder())
            .print()
            .replaceError(with: GenreResponse(genres: []))
            .receive(on: RunLoop.main)
            .map { return $0.genres as [Genre] }
            .sink {
                if($0.isEmpty && self.tryFetchGenres < 3) {
                    self.task?.cancel()
                    self.tryFetchGenres += 1
                    self.fetchGenres() {
                        
                    }
                    return
                } else {
                    self.genres = $0
                    completion()
                    
                }
            }
    }
}
