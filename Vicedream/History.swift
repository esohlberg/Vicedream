//
//  History.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/20/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation
import UIKit

struct Balance : Codable {
    var balance : Double
}


struct History: Codable {
    var vicedreamname : String
    var time: String
    var points: String
    var hours: Double!
    var vicenotdream: Bool
    
    init(vicedream: Vicedream, vicenotdream: Bool, points: Double) {
        self.vicedreamname = vicedream.name
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,], from: date)
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        self.time = String(hour!)  + ":" + String(format: "%02d", (minute!)) + " " + String(month!) + "/" + String(day!) + "/" + String(year!)
        self.vicenotdream = vicenotdream
        self.points = String(points)
    }
    enum CodingKeys: String, CodingKey {
        case vicedreamname
        case time
        case points
        case hours
        case vicenotdream
    }
}

internal struct historyKey {
    static let vicedreamname = "vicedreamname"
    static let time = "time"
    static let points = "points"
    static let hours = "hours"
    static let vicenotdream = "vicenotdream"
}
