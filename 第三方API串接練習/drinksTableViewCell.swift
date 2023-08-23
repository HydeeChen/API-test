//
//  drinksTableViewCell.swift
//  第三方API串接練習
//
//  Created by Hydee Chen on 2023/8/17.
//

import UIKit


class drinksTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
