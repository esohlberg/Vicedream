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
        return retrieveVicedream() ?? sampleVicedreams()
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
        storeVicedream()
    }
    func updateVicedream(at index: Int, with vicedream: Vicedream) {
        vicedreams[index] = vicedream
    }
    func removeVicedream(at index: Int) {
        vicedreams.remove(at: index)
        storeVicedream()
    }
    func storeVicedream() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(vicedreams)
            let success = NSKeyedArchiver.archiveRootObject(data, toFile: viceFile.path)
            print(success ? "Successful save" : "Save Failed")
        } catch {
            print("Save Failed!")
        }
    }
    func retrieveVicedream() -> [Vicedream]? {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: viceFile.path)
            as? Data else { return nil }
        do {
            let decoder = PropertyListDecoder()
            let vicedreams = try decoder.decode([Vicedream].self, from: data)
            return vicedreams
        } catch {
            print("Retrieve Failed")
            return nil
        }
    }
}
