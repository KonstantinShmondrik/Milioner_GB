//
//  Question.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import Foundation

struct Question {
    var textQuestion: String = ""
    var answerOptions: [String : String] = [:]
    var rightAnswer: String = ""
  
    init (textQuestion: String, answerOptions: [String : String], rightAnswer: String) {
    
    self.textQuestion = textQuestion
    self.answerOptions = answerOptions
    self.rightAnswer = rightAnswer
    }
}
