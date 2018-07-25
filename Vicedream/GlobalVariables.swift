//
//  GlobalVariables.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/21/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation

extension String {
    var doubleValue: Double? {
        return Double(self)
    }
}

var viceManager = vicedreamsManager()
var historyManager = HistoryManager()
var pointBalance:Double = 0
