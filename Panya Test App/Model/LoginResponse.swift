//
//  LoginResponse.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import Foundation

struct LoginResponse : Codable {
    let data : LoginData?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(LoginData.self, forKey: .data)
    }
    
}

struct LoginData : Codable {
    let name : String?
    let email : String?
    let consecutive_round_count : Int?
    let access_token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case email = "email"
        case consecutive_round_count = "consecutive_round_count"
        case access_token = "access_token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        consecutive_round_count = try values.decodeIfPresent(Int.self, forKey: .consecutive_round_count)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
    }
    
}
