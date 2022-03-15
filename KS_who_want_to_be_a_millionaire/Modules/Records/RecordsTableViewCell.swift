//
//  RecordsTableViewCell.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 10.03.2022.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recordsDate: UILabel!
    @IBOutlet weak var cashResult: UILabel!
    @IBOutlet weak var rightAnswersCount: UILabel!
    @IBOutlet weak var allQuestions: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
