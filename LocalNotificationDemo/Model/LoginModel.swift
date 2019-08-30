
import Foundation

struct Login:Codable{
    
    var status:Int?
    var message:String?
    var user_msg:String?
    var data : Userlogin?

    }

struct Userlogin:Codable {
    var id:Int?
    var role_id: Int?
    var first_name: String?
    var last_name: String?
    var username:String?
    var email: String?
    var gender: String?
    var phone_no: String?
    var is_active:Bool?
    var created:String?
    var profile_pic: String?
    var country_id:String?
    var dob:String?
    var modified : String?
    var access_token:String?
}
