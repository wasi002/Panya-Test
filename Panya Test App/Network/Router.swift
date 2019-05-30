//
//  Router.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import Foundation

import Alamofire


class Router {
    
    static let `default` = Router()
    
    func getCall(urlStr: String, header : HTTPHeaders? ,onSuccess: @escaping (_ response:Data?) -> (), onFail: @escaping (_ error: Error)->()){
        
        
        Alamofire.request(urlStr, method: .get, headers: header).validate()
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    if let mydata = response.data{
                        onSuccess(mydata)
                    }
                    else{
                        onSuccess(nil)
                    }
                case .failure(let error):
                    onFail(error)
                }
                
        }
        
        
    }
    
    func postCall(urlStr: String,parameters: Any, onSuccess: @escaping ( _ status:Data?) -> (), onFail: @escaping (_ error: Error)->()){
        
        Alamofire.request(urlStr, method: .post, parameters: (parameters as! Parameters),encoding: JSONEncoding.default).validate()
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    if let mydata = response.data{
                        onSuccess(mydata)
                    }
                    else{
                        onSuccess(nil)
                    }
                case .failure(let error):
                    onFail(error)
                }
                
        }
        
    }
    
}
