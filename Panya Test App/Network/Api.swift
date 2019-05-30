//
//  Api.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import Foundation
import Alamofire
class Api {
    
    static let `default` = Api()
    
    func streakBonuses(token :String, onSuccess: @escaping (_ response:BonusStreak?) -> (), onFail: @escaping (_ error: String)->()) {
        let webUrl = "\(baseUrl)\(STREAKBONUS)"
        
        
        let headers: HTTPHeaders = [
            ACCESSTOKEN: token,
            "Accept": "application/json"
        ]
      
        
        Router.default.getCall(urlStr: webUrl, header: headers,  onSuccess: { (response) in
            let jsonDecoder = JSONDecoder()
            
            do {
                let responseModel = try jsonDecoder.decode(BonusStreak.self, from: response!)

                if let _ = responseModel.data  {
                    onSuccess(responseModel)
                }
                else{
                    let errorModel = try jsonDecoder.decode(ErrorResponse.self, from: response!)
                    onFail(errorModel.error?.message ?? "NETWORK_ERROR".localized)
                    
                }
                
            }
            catch {
                onFail("NETWORK_ERROR".localized)
            }
        }) { (error) in
            onFail(error.localizedDescription)
        }
        
    }
    
    func login(email :String, password:String, onSuccess: @escaping (_ response:LoginResponse?) -> (), onFail: @escaping (_ error: String)->()) {
        let webUrl = ("\(baseUrl)\(LOGIN)")
        
        let params = JsonBuilder.loginJson(email: email, password: password)
        
        Router.default.postCall(urlStr: webUrl, parameters: params, onSuccess: { (response) in
            let jsonDecoder = JSONDecoder()
            
            do {
                let responseModel = try jsonDecoder.decode(LoginResponse.self, from: response!)
                
                if let _ = responseModel.data  {
                    onSuccess(responseModel)
                }
                else{
                    
                    let errorModel = try jsonDecoder.decode(ErrorResponse.self, from: response!)
                    onFail(errorModel.error?.message ?? "NETWORK_ERROR".localized)

                }
     
            }
            catch {
                onFail("NETWORK_ERROR".localized)
            }
        }) { (error) in
            onFail(error.localizedDescription)
            
        }
        
        
        
        
    }
    
}
