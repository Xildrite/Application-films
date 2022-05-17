//
//  GenresViewController.swift
//  Projet2
//
//  Created by Baptiste Taviot on 17/05/2022.
//


//Controller pour les genres

import UIKit
import SwiftUI

class GenresViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellReuseID: String = "GenreCellReuseId"
    let genreViewModel: GenreViewModel
    
    init(genreViewModel: GenreViewModel) {
        self.genreViewModel = genreViewModel
        super.init(nibName: "GenresViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
        collectionView.register(UINib(nibName: "GenreCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: cellReuseID)
        self.genreViewModel.fetchAllGenres {
            self.collectionView.reloadData()
        }

        // Do any additional setup after loading the view.
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
    extension GenresViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreViewModel.genres.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as? GenreCollectionViewCell) {
            cell.setupCell(title: genreViewModel.genres[indexPath.item].name)
            return cell
            
        }
        return UICollectionViewCell()
        }
    }
    
    extension GenresViewController: UICollectionViewDelegate{
            
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let idGenre = self.genreViewModel.genres[indexPath.row].id
            let swiftUIView = MovieViewController(movieViewModel: MovieViewModel(), genreViewModel: GenreViewModel())
            swiftUIView.genre = idGenre

            guard let navigationController = self.navigationController else {
                print("TEST")
                return
            }
            self.navigationController?.pushViewController(swiftUIView, animated: true)
        }

    }
        
