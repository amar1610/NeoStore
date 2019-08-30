//
//  ProductDetailViewController.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/24/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var id:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonParsing.callWebService(url: UrlEndPoints.getProductDetails, httpMethod:.get, responceTYpe: ProductDetailModel.self, parameters: ["product_id":id ?? 0], headers: nil) { data in
            print(data)
        }
    
    }
    

  

}
