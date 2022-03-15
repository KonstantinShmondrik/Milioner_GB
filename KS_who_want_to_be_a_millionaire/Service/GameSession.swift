//
//  GameSession.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import Foundation

class GameSession: Codable {
   
    var data = Double(NSDate().timeIntervalSince1970)
    var cashResult: Int = 0
    var rightAnswersCount: Int = 0
    var allQuestions: Int = 0
    var ratio: Int = 0
    
}
