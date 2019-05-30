//
//  ErrorResponse.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import Foundation

struct ErrorResponse : Codable {
    let error : PError?
    
    enum CodingKeys: String, CodingKey {
        
        case error = "error"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent(PError.self, forKey: .error)
    }
    
}

struct PError : Codable {
    let code : Int?
    let message : String?
    
    enum CodingKeys: String, CodingKey {
        
        case code = "code"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
}
