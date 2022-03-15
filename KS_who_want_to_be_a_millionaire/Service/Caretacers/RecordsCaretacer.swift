//
//  RecordsCaretacer.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 10.03.2022.
//

import Foundation

final class RecordsCaretacer {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func seve(records: [GameSession]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
   
    func retriveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {return []}
        
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    
}
