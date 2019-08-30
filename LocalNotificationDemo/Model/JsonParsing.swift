//
//  JsonParsing.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/22/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import Foundation
import Alamofire
class JsonParsing {
    static func callWebService<T:Codable>(url:String, httpMethod:HTTPMethod, responceTYpe:T.Type, parameters:[String:Any]? = nil, headers:[String:String]? = nil, complitionHandler:@escaping(T) -> Void) {
    
    
    let urlStr = ConstantUrl.serverURL + url
    
    guard let urlConvertable = URL(string: urlStr) else {
        print("Invalid URL string")
        return
    }
    Alamofire.request(urlConvertable, method: httpMethod, parameters: parameters,encoding: URLEncoding.default, headers: headers).responseJSON {
        response in
        switch response.result {
        case .success:
            if let data = response.data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    print(jsonData)
                    
                    let regData = try JSONDecoder().decode(T.self, from: data)
                    complitionHandler(regData)
                } catch {
                    print(error)
                }
                
            }
            break
        case .failure(let error):
            
            print(error)
        }
    }
    
    
}

}
