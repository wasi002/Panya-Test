//
//  RoundStreakViewController.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import UIKit
import UIGradient

class RoundStreakViewController: BaseViewController {

    
    var streakBonus = [Int]()
    var streakBonusFiltered = [Int]()
    var conextiveRowCount = 0
    
    @IBOutlet weak var roundsTableView: UITableView!{
        didSet {
            roundsTableView.dataSource = self
            roundsTableView.delegate = self
        }
    }
    
    @IBOutlet weak var roundCountLabel: UILabel!
    
    var loginResponse : LoginResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         getBonusStreaks()
    }
    
    
    func setUpData() {
        
        streakBonusFiltered = Array(Set(streakBonus))
        streakBonusFiltered.sort()
        roundsTableView.reloadData()
        
        
        guard let consectivePlayedRounds = loginResponse?.data?.consecutive_round_count else {
            
            return
        }
        
        conextiveRowCount =  consectivePlayedRounds

        let str1 = "CONSECUTIVE_ROUND_COUNT".localized
        let str2 = " \(conextiveRowCount) "
        let str3 = "ROUNDS_LABEL".localized
        
        
        let mutableAttributedString = NSMutableAttributedString()
        
        mutableAttributedString.append(str1.attributedString(attributedString: str1, isunderLine: false,textColor: .white, textFont: UIFont(name: "HelveticaNeue", size: 15.0)!))
        
        mutableAttributedString.append(str2.attributedString(attributedString: str2, isunderLine: false,textColor: UIColor.yellowPColor, textFont: UIFont(name: "HelveticaNeue", size: 15.0)!))
        
        mutableAttributedString.append(str3.attributedString(attributedString: str3, isunderLine: false,textColor: .white, textFont: UIFont(name: "HelveticaNeue", size: 15.0)!))
        
        
        roundCountLabel.attributedText = mutableAttributedString
        
    }
    
    func getBonusStreaks() {

        guard let accessToken = loginResponse?.data?.access_token else {
            self.showError(error: "TOKEN_INVALID".localized)

            return
        }

        
        PLoader.ShowLoader(view: self.view)
        
        Api.default.streakBonuses(token: accessToken, onSuccess: { (bonusStreakResponse) in
            PLoader.dismissLoader(view: self.view)
            if let bonusArray = bonusStreakResponse?.data?.streak_bonus {
                self.streakBonus = bonusArray
                self.setUpData()
            }

        }) { (error) in
            PLoader.dismissLoader(view: self.view)
            self.showError(error: error)
        }
        
    }

}


extension RoundStreakViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return streakBonusFiltered.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ROUND_VIEW_CELL_IDENTIFIER, for: indexPath) as! RoundsTableViewCell
        
        var isLastRow = false
        if streakBonusFiltered.count - 1 == indexPath.section {
            isLastRow = true
        }
        cell.setData(indexPath: indexPath, heartValue: streakBonusFiltered[indexPath.section], consectiveRowCount: conextiveRowCount, isLastRow: isLastRow)
        cell.selectionStyle = .none
        return cell
        
    }
    
    
}
