//
//  GameSceneViewController.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import UIKit

//protocol GameSceneDelegat: class {
//    func didEndGame(withResult result: Int)
//}

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(withResult result: GameSession)
}

class GameSceneViewController: UIViewController, GameViewControllerDelegate {
    func didEndGame(withResult result: GameSession) {
        self.delegate?.didEndGame(withResult: result)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var textQuestion: UILabel!
    
    @IBOutlet weak var textFoneView: UIView!{
        didSet{
            self.textFoneView.layer.borderColor = UIColor.gray.cgColor
            self.textFoneView.layer.borderWidth = 0.5
            self.textFoneView.clipsToBounds = true
            self.textFoneView.layer.cornerRadius = self.textFoneView.frame.width / 6
            self.textFoneView.layer.shadowColor = UIColor.black.cgColor
            self.textFoneView.layer.shadowRadius = 7
            self.textFoneView.layer.shadowOffset = CGSize.zero
            self.textFoneView.layer.shadowOpacity = 0.5
            self.textFoneView.backgroundColor = .systemGray
            
        }
    }
    
    @IBOutlet weak var answerA: UILabel!
    @IBOutlet weak var answerB: UILabel!
    @IBOutlet weak var answerC: UILabel!
    @IBOutlet weak var answerD: UILabel!
    
    @IBOutlet weak var answerAView: UIView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerAAction))
            answerAView.isUserInteractionEnabled = true
            answerAView.addGestureRecognizer(tap)
            
            self.answerAView.layer.borderColor = UIColor.gray.cgColor
            self.answerAView.layer.borderWidth = 0.5
            self.answerAView.clipsToBounds = true
            self.answerAView.layer.cornerRadius = self.answerAView.frame.width / 10
            self.answerAView.layer.shadowColor = UIColor.black.cgColor
            self.answerAView.layer.shadowRadius = 7
            self.answerAView.layer.shadowOffset = CGSize.zero
            self.answerAView.layer.shadowOpacity = 0.5
            self.answerAView.backgroundColor = .systemGray2
        }
    }
    @IBOutlet weak var answerBView: UIView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerBAction))
            answerBView.isUserInteractionEnabled = true
            answerBView.addGestureRecognizer(tap)
            
            self.answerBView.layer.borderColor = UIColor.gray.cgColor
            self.answerBView.layer.borderWidth = 0.5
            self.answerBView.clipsToBounds = true
            self.answerBView.layer.cornerRadius = self.answerBView.frame.width / 10
            self.answerBView.layer.shadowColor = UIColor.black.cgColor
            self.answerBView.layer.shadowRadius = 7
            self.answerBView.layer.shadowOffset = CGSize.zero
            self.answerBView.layer.shadowOpacity = 0.5
            self.answerBView.backgroundColor = .systemGray2
        }
    }
    @IBOutlet weak var answerCView: UIView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerCAction))
            answerCView.isUserInteractionEnabled = true
            answerCView.addGestureRecognizer(tap)
            
            self.answerCView.layer.borderColor = UIColor.gray.cgColor
            self.answerCView.layer.borderWidth = 0.5
            self.answerCView.clipsToBounds = true
            self.answerCView.layer.cornerRadius = self.answerCView.frame.width / 10
            self.answerCView.layer.shadowColor = UIColor.black.cgColor
            self.answerCView.layer.shadowRadius = 7
            self.answerCView.layer.shadowOffset = CGSize.zero
            self.answerCView.layer.shadowOpacity = 0.5
            self.answerCView.backgroundColor = .systemGray2
        }
    }
    @IBOutlet weak var answerDView: UIView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerDAction))
            answerDView.isUserInteractionEnabled = true
            answerDView.addGestureRecognizer(tap)
            
            self.answerDView.layer.borderColor = UIColor.gray.cgColor
            self.answerDView.layer.borderWidth = 0.5
            self.answerDView.clipsToBounds = true
            self.answerDView.layer.cornerRadius = self.answerDView.frame.width / 10
            self.answerDView.layer.shadowColor = UIColor.black.cgColor
            self.answerDView.layer.shadowRadius = 7
            self.answerDView.layer.shadowOffset = CGSize.zero
            self.answerDView.layer.shadowOpacity = 0.5
            self.answerDView.backgroundColor = .systemGray2
        }
    }
    
    @IBOutlet weak var resultLable: UILabel!
    
//    weak var gameDelegate: GameSceneDelegat?
    weak var delegate: GameViewControllerDelegate?
    
    
    let animations = CustomsAnimationServise()
    var question = Questionslibrary()
    var questionArr = [Question]()
    var geameSession = GameSession()
    let game = Game.shared
    var rightAnswersCount = 0
    var cashResult = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionArr.append(question.question1)
        questionArr.append(question.question2)
        questionArr.append(question.question3)
        questionArr.append(question.question4)
        questionArr.append(question.question5)
        questionArr.append(question.question6)
        questionArr.append(question.question7)
        questionArr.append(question.question8)
        questionArr.append(question.question9)
        questionArr.append(question.question10)
       
        
        getNextAnswer(i: rightAnswersCount)
      
        
//       delegate = self
        
        
    }
    
    //MARK: - Ответ A
    
    @objc func answerAAction(sender:UITapGestureRecognizer) {
        animations.clickButton(button: answerAView)
        if questionArr[rightAnswersCount].rightAnswer == questionArr[rightAnswersCount].answerOptions["A"] {
            
            rightAnswersCount += 1
            cashResult += 100
            getNextAnswer(i: rightAnswersCount)
            
            geameSession.cashResult = cashResult
            geameSession.rightAnswersCount = rightAnswersCount
            geameSession.allQuestions = questionArr.count
//            game.gameSessions?.cashResult = cashResult
//            game.gameSessions?.rightAnswersCount = rightAnswersCount
//            game.gameSessions?.allQuestions = questionArr.count
//            game.gameSessions = geameSession

            
            //            resultLable.text = "Текущий результат игры: \(result)"

        } else {
            
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
            
            //        self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Ответ B
    @objc func answerBAction(sender:UITapGestureRecognizer) {
        animations.clickButton(button: answerBView)
        if questionArr[rightAnswersCount].rightAnswer == questionArr[rightAnswersCount].answerOptions["B"] {
            rightAnswersCount += 1
            cashResult += 100
            getNextAnswer(i: rightAnswersCount)
            
            geameSession.cashResult = cashResult
            geameSession.rightAnswersCount = rightAnswersCount
            geameSession.allQuestions = questionArr.count
        } else {
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Ответ C
    @objc func answerCAction(sender:UITapGestureRecognizer) {
        animations.clickButton(button: answerCView)
        if questionArr[rightAnswersCount].rightAnswer == questionArr[rightAnswersCount].answerOptions["C"] {
            rightAnswersCount += 1
            cashResult += 100
           
            getNextAnswer(i: rightAnswersCount)
            geameSession.cashResult = cashResult
            geameSession.rightAnswersCount = rightAnswersCount
            geameSession.allQuestions = questionArr.count
        } else {
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Ответ D
    @objc func answerDAction(sender:UITapGestureRecognizer) {
        animations.clickButton(button: answerDView)
        if questionArr[rightAnswersCount].rightAnswer == questionArr[rightAnswersCount].answerOptions["D"] {
            rightAnswersCount += 1
            cashResult += 100
            getNextAnswer(i: rightAnswersCount)
            
            geameSession.cashResult = cashResult
            geameSession.rightAnswersCount = rightAnswersCount
            geameSession.allQuestions = questionArr.count
        } else {
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func getNextAnswer (i: Int) {
        if i < (questionArr.count-1){
            textQuestion.text = questionArr[i].textQuestion
            answerA.text = "\( questionArr[i].answerOptions["A"] ?? "")"
            answerB.text = "\( questionArr[i].answerOptions["B"] ?? "")"
            answerC.text = "\( questionArr[i].answerOptions["C"] ?? "")"
            answerD.text = "\( questionArr[i].answerOptions["D"] ?? "")"
           
            geameSession.cashResult = cashResult
            geameSession.rightAnswersCount = rightAnswersCount
            geameSession.allQuestions = questionArr.count
            
            resultLable.text = "Текущий результат игры: \(cashResult)"
        } else {
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
