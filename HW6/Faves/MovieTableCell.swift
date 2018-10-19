//
//  MovieTableCell.swift
//  Faves
//
//  Created by Zhong, Zhetao on 10/18/18.
//  Copyright © 2018 Zhong, Zhetao. All rights reserved.
//

import Foundation
import UIKit

class MovieTableCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var actor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
