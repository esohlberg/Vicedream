//
//  Vicedream.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/18/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation
import UIKit

struct Vicedream: Codable {
    var name: String
    var rate: Double
    var hourly: Bool
    
    init(name: String, rate: Double, hourly: Bool) {
        self.name = name
        self.rate = rate
        self.hourly = hourly
    }
}

internal struct vicedreamKey {
    static let name = "name"
    static let rate = "rate"
    static let hourly = "hourly"
}
