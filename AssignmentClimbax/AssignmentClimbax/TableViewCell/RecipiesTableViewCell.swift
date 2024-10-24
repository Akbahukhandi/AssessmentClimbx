//
//  RecipiesTableViewCell.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import UIKit

class RecipiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipiesLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var isFavorite: Bool = false {
        didSet {
            let imageName = isFavorite ? "heart.fill" : "heart" 
            favouriteButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
