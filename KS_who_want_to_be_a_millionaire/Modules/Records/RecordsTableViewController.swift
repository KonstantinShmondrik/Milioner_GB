//
//  RecordsTableViewController.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 10.03.2022.
//

import UIKit

class RecordsTableViewController: UITableViewController {
    
    var records = Game.shared.records.sorted(by: {$0.cashResult > $1.cashResult }) // сортируем по количеству денег
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return records.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordsCell", for: indexPath) as? RecordsTableViewCell else {return UITableViewCell()}
        
        cell.cashResult.text = "\(records[indexPath.item].cashResult) руб."
        cell.rightAnswersCount.text = "\(records[indexPath.item].rightAnswersCount)"
        cell.allQuestions.text = "\(records[indexPath.item].allQuestions)"
        
        let dateFormater: DateFormatter = {
            let result = DateFormatter()
            result.dateFormat = "dd.MM.yyyy HH.mm"
            return result
        }()
        
        cell.recordsDate.text = "\(dateFormater.string(from: (Date(timeIntervalSince1970:records[indexPath.item].data))))"
        
        return cell
    }
}
