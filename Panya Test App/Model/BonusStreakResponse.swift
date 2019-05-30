//
//  BonusStreak.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import Foundation

struct BonusStreak : Codable {
    let data : BonusStreakData?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(BonusStreakData.self, forKey: .data)
    }

    
}

struct BonusStreakData : Codable {
    let streak_bonus : [Int]?
    
    enum CodingKeys: String, CodingKey {
        
        case streak_bonus = "streak_bonus"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        streak_bonus = try values.decodeIfPresent([Int].self, forKey: .streak_bonus)
    }
    
}
