//
//  TableViewCell.swift
//  office
//
//  Created by 廖昱晴 on 2020/7/23.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var addressLabel : UILabel!
    @IBOutlet var phoneLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
