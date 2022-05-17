//
//  MovieViewController.swift
//  Projet2
//
//  Created by Baptiste Taviot on 04/04/2022.
//


//Controller pour les films

import UIKit
import SwiftUI

class MovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellReuseId: String = "MovieCellReuseId"
    let movieViewModel: MovieViewModel
    let genreViewModel: GenreViewModel
    var genre: Int?
    
    init(movieViewModel: MovieViewModel, genreViewModel: GenreViewModel) {
        self.genreViewModel = genreViewModel
        self.movieViewModel = movieViewModel
        
        
        super.init(nibName: "MovieViewController", bundle: Bundle.main)
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) hos not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self;
        tableView.delegate = self;
        
        tableView.separatorColor = .clear;
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellReuseId)
        
        
        if let genre = self.genre{
            self.movieViewModel.genre = genre
        }
        self.genreViewModel.fetchGenres(){
            self.tableView.reloadData()
        }
        self.movieViewModel.fetchMovies(){
            self.tableView.reloadData()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.movies.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = (tableView.dequeueReusableCell(withIdentifier: cellReuseId) as? MovieTableViewCell) {
            cell.setupCell(
                imageCard: ApiViewModel.apiImgDomain + movieViewModel.movies[indexPath.item].poster_path,
                title: movieViewModel.movies[indexPath.item].title,
                datee: movieViewModel.movies[indexPath.item].release_date,
                description: movieViewModel.movies[indexPath.item].overview
            )
            return cell;
        }
        return UITableViewCell();
    }
}

extension MovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("row: \(indexPath.row)")
        let index = indexPath.row;
        
        let hostVC = UIHostingController(rootView: MovieDetailsView(
            image: ApiViewModel.apiImgDomain + movieViewModel.movies[index].poster_path,
            imageCard: ApiViewModel.apiImgDomain + movieViewModel.movies[index].backdrop_path,
            title: movieViewModel.movies[index].title,
            subtitle: movieViewModel.movies[index].original_title,
            date: movieViewModel.movies[index].release_date,
            note: movieViewModel.movies[index].vote_average,
            description: movieViewModel.movies[index].overview,
            bandeannonce: String(movieViewModel.movies[index].video),
            categorie: movieViewModel.movies[index].genre_ids,
            movieViewModel: movieViewModel,
            genreViewModel: genreViewModel
        ));
        present(hostVC, animated: true);
        
        //        navigationController?.pushViewController(hostVC, animated: true);
    }
}
