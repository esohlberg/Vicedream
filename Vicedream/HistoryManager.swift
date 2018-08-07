//
//  HistoryManager.swift
//  EarnedIt
//
//  Created by Emil Sohlberg on 7/20/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation

private let appSupportDirectory: URL = {
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

private let historyFile = appSupportDirectory.appendingPathComponent("Histories")

class HistoryManager {
    private lazy var histories: [History] = self.loadHistory()
    var historiesCount: Int {return histories.count}
    func getHistory(at index: Int) -> History {
        return histories[index]
    }
    func loadHistory() -> [History] {
        return retrieveHistories() ?? sampleHistories()
    }
    func addHistory(_ history: History) {
        histories.insert(history, at:0 )
        storeHistories()
    }
    func updateHistory(at index: Int, with history: History) {
        histories[index] = history
        storeHistories()
    }
    func storeHistories() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(histories)
            let success = NSKeyedArchiver.archiveRootObject(data, toFile: historyFile.path)
            print(success ? "Successful save" : "Save Failed")
        } catch {
            print("Save Failed!")
        }
    }
    func retrieveHistories() -> [History]? {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: historyFile.path)
            as? Data else { return nil }
        do {
            let decoder = PropertyListDecoder()
            let histories = try decoder.decode([History].self, from: data)
            return histories
        } catch {
            print("Retrieve Failed")
            return nil
        }
    }
    private func sampleHistories() -> [History] {
        let fakevicedream = Vicedream(name: "Lit", rate: 2, hourly: true)
        let histories = [
            History(vicedream : fakevicedream, vicenotdream: true, points: 100),
        ]
        return histories
    }
}
