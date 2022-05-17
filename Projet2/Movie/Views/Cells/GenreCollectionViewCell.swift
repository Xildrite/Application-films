//
//  GenreCollectionViewCell.swift
//  Projet2
//
//  Created by Baptiste Taviot on 17/05/2022.
//

//Code d'une cellule d'un genre

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text=nil
    }
    func setupCell(title: String){
        titleLabel.text = title
    }


}


