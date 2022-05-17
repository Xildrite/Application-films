//
//  MovieTableViewCell.swift
//  Projet2
//
//  Created by Baptiste Taviot on 04/04/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        imageCell.image = UIImage(named: "empty");
        
        //Ici que l'on va reset les valeurs
    }
    func setupCell(imageCard: String, title: String, datee: String ,description: String){
        imageCell.load(
            url: URL(string: imageCard)!,
            placeholder: UIImage()
        );
        titleLabel.text = title
        date.text = datee
        descLabel.text = description
    }
}
