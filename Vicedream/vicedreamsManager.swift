//
//  vicedreamsManager.swift
//  Vicedream
//
//  Created by Emil Sohlberg on 7/18/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation

class vicedreamsManager {
    private lazy var vicedreams: [Vicedream] = self.loadVicedreams()
    var vicedreamsCount: Int {return vicedreams.count}
    func getVicedream(at index: Int) -> Vicedream {
        return vicedreams[index]
    }
    private func loadVicedreams() -> [Vicedream] {
        return sampleVicedreams()
    }
    private func sampleVicedreams() -> [Vicedream] {
        let vicedreams = [
            Vicedream(name: "Work out", rate: -1.2, hourly: true),
            Vicedream(name: "Wake up before 8:30", rate: -0.4, hourly: false),
            Vicedream(name: "Eat a full meal", rate: -0.2, hourly: false)
        ]
        return vicedreams
    }
    func addVicedream(_ vicedream: Vicedream) {
        vicedreams.append(vicedream)
    }
    func updateVicedream(at index: Int, with vicedream: Vicedream) {
        vicedreams[index] = vicedream
    }
    func removeVicedream(at index: Int) {
        vicedreams.remove(at: index)
    }
}
