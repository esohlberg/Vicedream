//
//  GlobalVariables.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/21/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation

let appSupportDirectory: URL = {
    let url = FileManager().urls(
        for: .applicationSupportDirectory,
        in: .userDomainMask).first!
    if !FileManager().fileExists(atPath: url.path) {
        do {
            try FileManager().createDirectory(at: url, withIntermediateDirectories: false)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    return url
} ()

let historyFile = appSupportDirectory.appendingPathComponent("Histories")
let viceFile = appSupportDirectory.appendingPathComponent("Vices")

extension String {
    var doubleValue: Double? {
        return Double(self)
    }
}

var viceManager = vicedreamsManager()
var historyManager = HistoryManager()
var pointBalance:Double = 0
