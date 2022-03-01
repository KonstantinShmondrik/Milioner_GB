//
//  StartScreenViewController.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import UIKit

extension StartScreenViewController: GameViewControllerDelegate{
    func didEndGame(withResult result: GameSession) {
        game.gameSessions = result
        self.gameScore.text = "\(result.cashResult) руб."
        self.allQuestions.text = "\(result.allQuestions)"
        self.rightQuestionsScore.text = "\(result.rightAnswersCount)"
        self.retio.text = "\(game.retio)"
        print(game.records.count)
        print("\(String(describing: game.records.last?.cashResult))")
    }
    
    
}

class StartScreenViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var gameScore: UILabel!
    
    @IBOutlet weak var rightQuestionsScore: UILabel!
    @IBOutlet weak var allQuestions: UILabel!
    @IBOutlet weak var retio: UILabel!
    
    
    var game = Game.shared
    var gameSession = GameSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameScore.text = "\(game.records.last?.cashResult)"
        print("\(game.records.last?.cashResult)")
        self.allQuestions.text = "\(gameSession.allQuestions)"
        self.rightQuestionsScore.text = "\(gameSession.rightAnswersCount)"
        self.retio.text = "\(game.retio)"
      
        // Do any additional setup after loading the view.
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
        game.addRecord(gameSession)
    }
    
    
}
