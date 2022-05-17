
import Foundation
import WebKit
import Combine

class MovieViewModel: ObservableObject {
    
    private var task: AnyCancellable?
    @Published var movies: [Movie] = []
    var genre: Int?
    
    private var tryFetchMovies: Int = 0
    func fetchMovies(page:Int = 1, completion: @escaping () -> ()) {
        var url = ApiViewModel.discoverUrl + "&page=" + String(page) + "&language=fr-FR"
        
        if let idGenre = self.genre{
            url = "\(url)&with_genres=\(idGenre)"
        }
        
        print(url)
        task?.cancel()
        task = URLSession.shared
            .dataTaskPublisher(for: URL(string: url)!)
            .map { return $0.data; }
        //.eraseToAnyPublisher()
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .print()
            .replaceError(with: MovieResponse(page: 0, results: [], total_pages: 0, total_results: 0))
        //.eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .map { return $0.results as [Movie] }
            .sink {
                if($0.isEmpty && self.tryFetchMovies < 3) {
                    print(self.tryFetchMovies)
                    self.task?.cancel()
                    self.tryFetchMovies += 1
                    self.fetchMovies(page: page) {
                    }
                    return
                } else {
                    self.movies = $0
                    completion()
                    print($0)
                }
            }
    }
}
