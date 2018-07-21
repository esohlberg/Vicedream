//
//  History.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/20/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation
import UIKit

struct History {
    var vicedream: Vicedream
    var time: String
    var hours: Double!
    var vicenotdream: Bool
    
    init(vicedream: Vicedream, vicenotdream: Bool) {
        self.vicedream = vicedream
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,], from: date)
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        self.time = String(hour!)  + ":" + String(minute!) + " " + String(month!) + "/" + String(day!) + "/" + String(year!)
        self.vicenotdream = vicenotdream
    }
}
