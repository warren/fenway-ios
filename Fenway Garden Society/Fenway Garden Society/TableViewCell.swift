//
//  TableViewCell.swift
//  Fenway Garden Society
//
//  Created by Warren Partridge on 11/28/16.
//  Copyright © 2016 BU Global App Initiative. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
