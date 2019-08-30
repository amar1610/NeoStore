 
import Foundation
struct Register:Codable{
    
    var status:Int?
    var message:String?
    var userMsg:String?
    var data : Userdata?
    var message1:Message1?


struct Message1 : Codable{
    struct Email:Codable{
        var valid:String?
    }
    struct Password:Codable {
        var minlength:String?
    }
    var email :Email?
    var password:Password?
}

enum CodingKeys:String, CodingKey {
    case msg = "message"
    case status = "status"
    case userMsg = "user_msg"
    case data = "data"
}

init(from decoder: Decoder) throws {
    let value = try! decoder.container(keyedBy: CodingKeys.self)
    
    do {
        status = try value.decode(Int.self, forKey: .status)
        if status == 200 {
            do {
                data = try value.decode(Userdata.self, forKey: .data)
            }
          
        }
    } catch {
        print(error)
    }
    
    do {
        userMsg = try value.decode(String.self, forKey: .userMsg)
    } catch {
        print(error)
    }
    
    do {
        message = try value.decode(String.self, forKey: .msg)
    } catch  {
        print(error)
        do {
            message1 = try value.decode(Message1.self, forKey: .msg)
        } catch {
            print(error)
        }
    }
}

func encode(to encoder: Encoder) throws {
}
}



struct Userdata:Codable {
    var id:Int?
    var role_id: Int?
    var first_name: String?
    var last_name: String?
    var username:String?
    var email: String?
    var gender: String?
    var phone_no: Int?
    var is_active:String?
    var created: String?
    var modified : String?
    var access_token:String?
}
