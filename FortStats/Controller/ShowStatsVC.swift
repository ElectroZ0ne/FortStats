//
//  ShowStatsVC.swift
//  FortStats
//
//  Created by ElectroZone on 2018-03-12.
//  Copyright © 2018 Wassim Mouhajer. All rights reserved.
//

import UIKit
import Alamofire

class ShowStatsVC: UIViewController {

    @IBOutlet weak var winsLbl: UILabel!
    @IBOutlet weak var firstTopLbl: UILabel!
    @IBOutlet weak var secondTopLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var matchesPlayedLbl: UILabel!
    @IBOutlet weak var winPercentageLbl: UILabel!
    @IBOutlet weak var killsLbl: UILabel!
    @IBOutlet weak var kdRatioLbl: UILabel!
    
    var fortnite = Fortnite()
    
    //Fetch data
    func grab() {
        //Make a call to fetch the stats
        do {
            try fortnite.downloadFortniteStats {
                self.updateUI()
                //If no profile is found
                if self.scoreLbl.text == "" {
                    let alert = UIAlertController(title: "No Profile Found", message: "Make sure the name/platform is correct", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        grab()
    }

    //Update the text of each stat
    func updateUI() {
        winsLbl.text = fortnite.wins
        firstTopLbl.text = fortnite.top3
        secondTopLbl.text = fortnite.top6
        scoreLbl.text = fortnite.score
        matchesPlayedLbl.text = fortnite.matchesPlayed
        winPercentageLbl.text = fortnite.winPercentage
        killsLbl.text = fortnite.kills
        kdRatioLbl.text = fortnite.kdRatio
    }

}
