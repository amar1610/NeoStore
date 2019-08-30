//
//  MenuTableViewCell.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/23/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var slideMenuCellImage: UIImageView!
    @IBOutlet weak var slideMenuCellTitle: UILabel!
    @IBOutlet weak var slidemenuBagcount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
