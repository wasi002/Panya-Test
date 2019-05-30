//
//  RoundsTableViewCell.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import UIKit

class RoundsTableViewCell: UITableViewCell {

    @IBOutlet weak var roundA: RoundView!
    @IBOutlet weak var roundB: RoundView!
    @IBOutlet weak var roundC: RoundView!
    @IBOutlet weak var roundD: RoundView!
    @IBOutlet weak var roundE: RoundView!

    @IBOutlet weak var bonusImgView: UIImageView!
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var receivedImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(indexPath :IndexPath , heartValue : Int , consectiveRowCount : Int, isLastRow : Bool) {
        
        if isLastRow {
            bonusImgView.image = UIImage(named: "ic_streak_chest")
        }
        else{
            bonusImgView.image = UIImage(named: "ic_streak_heart_l")

        }
        
        bonusLabel.text = "+\(heartValue)"
        
        
        let currentRow =  indexPath.section*5
        
        for i in 0..<5 {
            
            let roundNumber = currentRow+(i+1)
            
            switch i {
            case 0:
                roundNumber <= consectiveRowCount ? roundA.setHighlighted() : roundA.setUncovered()
                roundA.roundLabel.text = "\(roundNumber)"

            case 1:
                roundNumber <= consectiveRowCount ? roundB.setHighlighted() : roundB.setUncovered()
                roundB.roundLabel.text  = "\(roundNumber)"

            case 2:
                roundNumber <= consectiveRowCount ? roundC.setHighlighted() : roundC.setUncovered()
                roundC.roundLabel.text  = "\(roundNumber)"

            case 3:
                roundNumber <= consectiveRowCount ? roundD.setHighlighted() : roundD.setUncovered()
                roundD.roundLabel.text  = "\(roundNumber)"

            case 4:
                roundNumber <= consectiveRowCount ? roundE.setHighlighted() : roundE.setUncovered()
                roundE.roundLabel.text  = "\(roundNumber)"
                receivedImgView.isHidden =    roundNumber <= consectiveRowCount ?  false :  true

            default:

                break
            }
        }
        
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
