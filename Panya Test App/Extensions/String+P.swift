//
//  String+P.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


extension String: Error { }
extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    subscript (i: Int) -> Character? {
        if i < 0 || i >= self.count {
            return nil
        }else{
            return self[self.index(self.startIndex, offsetBy: i)]
        }
    }
    
    subscript (i: Int) -> String {
        let character : Character? = self[i]
        if let ch = character{
            return String(ch)
        }else{
            return ""
        }
    }
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    public func containsSpecialCharacters() -> Bool {
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
            return true
        }
        return false
    }
    
    public func removingRegexMatches(pattern: String, replaceWith: String = "") -> String {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSMakeRange(0, self.count)
            return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
        } catch {
            return self
        }
    }
    
    public func stringtoInt () -> Int{
        
        return Int(self)!
        
    }
    
    public func stringByStrippingHTML () -> String{
        
        let str = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        
        return str
        
    }
    
    
    public func attributedString(attributedString : String , isunderLine : Bool ,textColor : UIColor , textFont : UIFont) -> NSAttributedString{
        
        let underLineStyle = NSUnderlineStyle.single.rawValue
        
        var labelAtributes:[NSAttributedString.Key : Any] = [:]
        
        if isunderLine {
            labelAtributes  = [
                NSAttributedString.Key.font: textFont,
                NSAttributedString.Key.foregroundColor: textColor,
                NSAttributedString.Key.underlineStyle: underLineStyle,
                NSAttributedString.Key.underlineColor: textColor
            ]
        }
        else{
            
            labelAtributes  = [
                NSAttributedString.Key.font: textFont,
                NSAttributedString.Key.foregroundColor: textColor
            ]
        }
        
        
        
        let underlineAttributedString = NSAttributedString(string: attributedString,
                                                           attributes: labelAtributes)
        return underlineAttributedString
        
    }
    
    
}
