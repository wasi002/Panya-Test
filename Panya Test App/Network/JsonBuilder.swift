//
//  JsonBuilder.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import Foundation


class JsonBuilder {
    
    class func loginJson(email: String, password: String) -> Any {
        return [
            EMAIL: email,
            PASSWORD: password
        ]
    }
    
    
}
