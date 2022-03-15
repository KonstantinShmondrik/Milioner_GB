//
//  StartScreenViewController.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import UIKit
import Foundation

extension StartScreenViewController: GameViewControllerDelegate {
    
    func didEndGame(withResult result: GameSession) {
        
        game.gameSessions = result
        self.gameScore.text = "\(result.cashResult) руб."
        self.allQuestions.text = "\(result.allQuestions)"
        self.rightQuestionsScore.text = "\(result.rightAnswersCount)"
        self.ratio.text = "\(result.ratio)"
    }
}

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var gameScore: UILabel!
    
    @IBOutlet weak var rightQuestionsScore: UILabel!
    @IBOutlet weak var allQuestions: UILabel!
    @IBOutlet weak var ratio: UILabel!
    
    @IBOutlet weak var questionsOrderLabel: UILabel!
    
    var game = Game.shared
    var gameSession = GameSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(randomQuestionsOrderAction), name: NSNotification.Name("\(QuestionsOrder.random)"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(successivelyQuestionsOrderAction), name: NSNotification.Name("\(QuestionsOrder.successively)"), object: nil)
        
        
        
        self.gameScore.text = "\(gameSession.cashResult)"
        self.allQuestions.text = "\(gameSession.allQuestions)"
        self.rightQuestionsScore.text = "\(gameSession.rightAnswersCount)"
        self.ratio.text = "\(gameSession.ratio) %"
        
        
        self.questionsOrderLabel.text = "Вопросы последовательно"
        
        
    }
    
    //     MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameSceneViewController
            else {return}
            destination.delegate = self
            
        default:
            
            break
        }
    }
    
    
    @IBAction func startGameButtonActions(_ sender: Any) {
        print("Игра началась")
        
    }
    
    @objc func successivelyQuestionsOrderAction() {
        print("Наблюдатель увидел сообщение")
        questionsOrderLabel.text = "Вопросы последовательно"
    }
    
    @objc func randomQuestionsOrderAction() {
        print("Наблюдатель увидел сообщение")
        questionsOrderLabel.text = "Вопросы в случайном порядке"
    }
    
    
}
