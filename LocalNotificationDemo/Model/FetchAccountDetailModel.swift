//
//  FetchAccountDetailModel.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/23/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import Foundation
struct FetchAccountDetail:Codable
{
    var status:Int?
    var data:UserDetail?
    var message:String?
    var user_msg:String?
}
struct UserDetail:Codable{
    var user_data:Userdetails?
     var product_categories:[Product_details]?
}
 struct  Userdetails:Codable{
    var id:Int?
    var role_id:Int?
    var first_name:String?
    var last_name:String?
    var email:String?
    var username:String?
    var profile_pic:String?
    var country_id:String?
    var gender:String?
    var phone_no:String?
    var dob:String?
    var is_active:Bool?
    var created:String?
    var modified:String?
    var access_token: String?
    var total_carts:Int?
    var total_orders:Int?
}
struct Product_details:Codable {
    var id:Int?
     var name: String?
     var icon_image:String?
     var created: String?
    var modified:String?
}

