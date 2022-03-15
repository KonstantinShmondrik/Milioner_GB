//
//  SettingsViewController.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 12.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var questionsOrderControl: UISegmentedControl!
    
    private var selectedQuestionsOrder: QuestionsOrder {
        switch self.questionsOrderControl.selectedSegmentIndex {
        case 0:
            return .successively
        case 1:
            return .random
        default:
            return .successively
        }
    }
    
    var game = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    @IBAction func questionsOrderAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("\(selectedQuestionsOrder)"), object: nil)
        Game.shared.questionsOrder = selectedQuestionsOrder
        print("\(selectedQuestionsOrder)")
        
    }
    
    @IBAction func clearRecordsAction(_ sender: Any) {
        game.clearRecords()
    }
    
    @IBAction func clearQuestionAction(_ sender: Any) {
        
        game.clearQuestion()
    }
}
