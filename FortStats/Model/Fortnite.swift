//
//  Fortnite.swift
//  FortStats
//
//  Created by ElectroZone on 2018-03-11.
//  Copyright © 2018 Wassim Mouhajer. All rights reserved.
//

import UIKit
import Alamofire


class Fortnite {

    private var _wins: String!
    private var _top3: String!
    private var _top6: String!
    private var _score: String!
    private var _matchesPlayed: String!
    private var _winPercentage: String!
    private var _kills: String!
    private var _kdRatio: String!
    private var _killsPerMin: String!
    private var _timePlayed: String!
    private var _avgSurvivalTime: String!

    var wins: String {
        if _wins == nil {
            _wins = ""
        }
        return _wins
    }

    var top3: String {
        if _top3 == nil {
            _top3 = ""
        }
        return _top3
    }

    var top6: String {
        if _top6 == nil {
            _top6 = ""
        }
        return _top6
    }

    var score: String {
        if _score == nil {
            _score = ""
        }
        return _score
    }

    var matchesPlayed: String {
        if _matchesPlayed == nil {
            _matchesPlayed = ""
        }
        return _matchesPlayed
    }

    var winPercentage: String {
        if _winPercentage == nil {
            _winPercentage = ""
        }
        return _winPercentage
    }

    var kills: String {
        if _kills == nil {
            _kills = ""
        }
        return _kills
    }

    var kdRatio: String {
        if _kdRatio == nil {
            _kdRatio = ""
        }
        return _kdRatio
    }

    var killsPerMin: String {
        if _killsPerMin == nil {
            _killsPerMin = ""
        }
        return _killsPerMin
    }

    var timePlayed: String {
        if _timePlayed == nil {
            _timePlayed = ""
        }
        return _timePlayed
    }

    var avgSurvivalTime: String {
        if _avgSurvivalTime == nil {
            _avgSurvivalTime = ""
        }
        return _avgSurvivalTime
    }

    let headers: HTTPHeaders = ["TRN-Api-Key": API_KEY,"Accept" : "application/json"]

    func downloadFortniteStats(completed: @escaping DownloadComplete) {
        Alamofire.request(BASE_URL,headers: headers).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,Any> {
                print(dict)
                if let username = dict["epicUserHandle"] as? String {
                    print(username)
                }

                if let type = dict["platformName"] as? String {
                    print(type)
                }

                if let lifeTimeStats = dict["lifeTimeStats"] as? [Dictionary<String, AnyObject>] {

                    if let wins = lifeTimeStats[8] as? Dictionary<String, AnyObject> {
                        if let value = wins["value"] as? String {
                            print(value)
                            self._wins = value
                        }
                    }

                    if let top3 = lifeTimeStats[0] as? Dictionary<String, AnyObject> {
                        if let value = top3["value"] as? String {
                            print(value)
                            self._top3 = value
                        }
                    }

                    if let top6 = lifeTimeStats[3] as? Dictionary<String, AnyObject> {
                        if let value = top6["value"] as? String {
                            print(value)
                            self._top6 = value
                        }
                    }

                    if let score = lifeTimeStats[6] as? Dictionary<String, AnyObject> {
                        if let value = score["value"] as? String {
                            print(value)
                            self._score = value
                        }
                    }

                    if let matchesPlayed = lifeTimeStats[7] as? Dictionary<String, AnyObject> {
                        if let value = matchesPlayed["value"] as? String {
                            print(value)
                            self._matchesPlayed = value
                        }
                    }
            
                    if let winPercentage = lifeTimeStats[9] as? Dictionary<String, AnyObject> {
                        if let value = winPercentage["value"] as? String {
                            print(value)
                            self._winPercentage = value
                        }
                    }

                    if let kills = lifeTimeStats[10] as? Dictionary<String, AnyObject> {
                        if let value = kills["value"] as? String {
                            print(value)
                            self._kills = value
                        }
                    }

                    if let kdRatio = lifeTimeStats[11] as? Dictionary<String, AnyObject> {
                        if let value = kdRatio["value"] as? String {
                            print(value)
                            self._kdRatio = value
                        }
                    }
                }
                completed()
            }

        }
    }

    
}
