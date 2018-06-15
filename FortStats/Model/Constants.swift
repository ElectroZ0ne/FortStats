//
//  Constants.swift
//  FortStats
//
//  Created by ElectroZone on 2018-03-11.
//  Copyright © 2018 Wassim Mouhajer. All rights reserved.
//

import UIKit

let BASE_URL = "https://api.fortnitetracker.com/v1/profile/\(User.sharedInstance.type!)/\(User.sharedInstance.username!)"
let API_KEY = ""

typealias DownloadComplete = () -> ()
