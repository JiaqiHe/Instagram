//
//  PostCell.swift
//  instagram
//
//  Created by Jiaqi He on 2/24/18.
//  Copyright © 2018 Jiaqi He. All rights reserved.
//

import UIKit
import ParseUI

class PostCell: UITableViewCell {
    @IBOutlet weak var captionField: UILabel!
    @IBOutlet weak var postImage: PFImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
