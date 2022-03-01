//
//  Game.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import Foundation
final class Game{
    
    static let shared = Game()
    
    private(set) var records: [GameSession] = []
    var gameSessions: GameSession?
    var retio: Int {
        let ret = (gameSessions?.rightAnswersCount ?? 0) / (gameSessions?.allQuestions ?? 1) * 100
        return ret
    }
    
    private init(){}
    func addRecord(_ record: GameSession){
        self.records.append(record)
    }
    
    func clearRecords(){
        self.records = []
    }
}
