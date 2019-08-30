//
//  Singleton.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/23/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import Foundation
class Singleton{
    static let shared = Singleton()
    var userdata:Userlogin?
    var product_detail:[Product_details]?
    var products:ProductListModel?
    
}
