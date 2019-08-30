//
//  ProductListModel.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/24/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import Foundation
struct ProductListModel
: Codable {
    var status:Int?
    var data: [ProductLists]?
    
}
struct ProductLists
: Codable{
        var id:Int?
        var product_category_id: Int?
        var name: String?
        var producer:String?
        var description: String?
        var cost:Int?
        var rating:Int?
        var view_count:Int?
        var created:String?
        var modified:String?
        var product_images:String?

}
