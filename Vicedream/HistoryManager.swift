//
//  HistoryManager.swift
//  EarnedIt
//
//  Created by Emil Sohlberg on 7/20/18.
//  Copyright © 2018 Emil Sohlberg. All rights reserved.
//

import Foundation

class HistoryManager {
    private lazy var histories: [History] = []
    var historiesCount: Int {return histories.count}
    
    func getHistory(at index: Int) -> History {
        return histories[index]
    }
    func addHistory(_ history: History) {
        histories.insert(history, at:0 )
    }
    func updateHistory(at index: Int, with history: History) {
        histories[index] = history
    }
}
