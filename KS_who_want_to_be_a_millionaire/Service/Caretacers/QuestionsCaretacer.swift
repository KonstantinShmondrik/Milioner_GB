//
//  QuestionsCaretacer.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 15.03.2022.
//

import Foundation

final class QuestionsCaretacer {
   
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
    
    func seve(question: [Question]) {
        do {
            let data = try self.encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
   
    func retriveQuestion() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {return []}
        
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    
}
