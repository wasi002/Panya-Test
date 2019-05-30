//
//  RoundView.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import UIKit

class RoundView: UIView {

    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var roundTitleLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!


    func setHighlighted() {
        roundTitleLabel.textColor = UIColor.darkPColor
        roundLabel.textColor = UIColor.yellowPColor
        bgImgView.image = UIImage(named: "bg_streak_info_pink")
        self.alpha = 1.0
    }
    
    
    func setUncovered() {
        roundTitleLabel.textColor = UIColor.white
        roundLabel.textColor = UIColor.white
        bgImgView.image = nil
        bgImgView.backgroundColor = UIColor.darkPColor
        self.alpha = 0.6

    }
    
}
