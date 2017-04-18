//
//  SampleTableViewCell.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 18.04.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {


    @IBOutlet weak var LblTitle: UILabel!
    @IBOutlet weak var lvPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
