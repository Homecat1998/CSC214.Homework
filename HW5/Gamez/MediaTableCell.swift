//

//   UITableViewCell.swift
//   Gamez
//
//  Created by: CSC214 Instructor on 10/11/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class MediaTableCell: UITableViewCell {
    
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
