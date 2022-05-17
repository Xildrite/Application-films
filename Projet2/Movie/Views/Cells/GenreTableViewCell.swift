//
//  GenreTableViewCell.swift
//  Projet2
//
//  Created by Baptiste Taviot on 17/05/2022.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
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
        titleLabel.text=nil
    }
    func setupCell(title: String){
        titleLabel.text = title
    }
    
}
