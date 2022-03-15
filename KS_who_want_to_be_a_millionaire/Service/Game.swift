//
//  Game.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    private init() {
        self.records = self.recordsCaretacer.retriveRecords()
        self.questions = self.questionCaretacer.retriveQuestion()
    }
    
    private var recordsCaretacer = RecordsCaretacer()
    private var questionCaretacer = QuestionsCaretacer()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsCaretacer.seve(records: self.records)
        }
    }
    
    private(set) var questions: [Question] {
        didSet {
            questionCaretacer.seve(question: self.questions)
        }
    }
    
    var gameSessions: GameSession?
    
    var ratio: Int {
        let result = (gameSessions?.rightAnswersCount ?? 0) / (gameSessions?.allQuestions ?? 1 ) * 100
        //        print("\(gameSessions?.rightAnswersCount) \(gameSessions?.allQuestions)")
        return result
    }
    
    
    var questionsOrder: QuestionsOrder = .successively
    
    func addRecord(_ record: GameSession) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    func addQuestion(_ question: Question) {
        self.questions.append(question)
    }
    
    func clearQuestion() {
        self.questions = []
    }
}
