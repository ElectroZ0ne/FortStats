//
//  User.swift
//  FortStats
//
//  Created by ElectroZone on 2018-03-12.
//  Copyright © 2018 Wassim Mouhajer. All rights reserved.
//

import Foundation

class User {
    static var sharedInstance = User()
    private init() {}
    
    var type: String!
    var username: String!
}
