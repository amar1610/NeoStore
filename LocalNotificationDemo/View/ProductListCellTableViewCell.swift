//
//  ProductListCellTableViewCell.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/24/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit

class ProductListCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellProductImage: UIImageView!
    @IBOutlet weak var cellProductTitle: UILabel!
    @IBOutlet weak var cellProductSubTitle: UILabel!
    @IBOutlet weak var cellProductPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
