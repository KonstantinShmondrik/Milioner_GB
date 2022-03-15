//
//  GameSceneViewController.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import UIKit


protocol GameViewControllerDelegate: AnyObject {
    
    func didEndGame(withResult result: GameSession)
}

class GameSceneViewController: UIViewController, GameViewControllerDelegate {
    
    
    
    @IBOutlet weak var ExitButton: UIButton!
    
    @IBOutlet weak var textQuestion: UILabel!
    
    @IBOutlet weak var textQuestionView: UIView! {
        didSet{
            animations.setTextFoneView(textFoneView: textQuestionView)
            
        }
    }
    
    @IBOutlet weak var answerA: UILabel!
    @IBOutlet weak var answerB: UILabel!
    @IBOutlet weak var answerC: UILabel!
    @IBOutlet weak var answerD: UILabel!
    
    @IBOutlet weak var answerAView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerAAction))
            answerAView.isUserInteractionEnabled = true
            answerAView.addGestureRecognizer(tap)
            
            animations.setButtonView(button: answerAView)
        }
    }
    
    @IBOutlet weak var answerBView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerBAction))
            answerBView.isUserInteractionEnabled = true
            answerBView.addGestureRecognizer(tap)
            
            animations.setButtonView(button: answerBView)
        }
    }
    
    @IBOutlet weak var answerCView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerCAction))
            answerCView.isUserInteractionEnabled = true
            answerCView.addGestureRecognizer(tap)
            
            animations.setButtonView(button: answerCView)
        }
    }
    
    @IBOutlet weak var answerDView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(answerDAction))
            answerDView.isUserInteractionEnabled = true
            answerDView.addGestureRecognizer(tap)
            
            animations.setButtonView(button: answerDView)
            
        }
    }
    
    @IBOutlet weak var resultLable: UILabel!
    
    weak var delegate: GameViewControllerDelegate?
    
    let animations = CustomsAnimationServise()
    let game = Game.shared
    
    var question = Questionslibrary()
    var questionArr = [Question]()
    var geameSession = GameSession()
    var rightAnswersCount = 0
    var cashResult = 0
    var questionsOrder = Game.shared.questionsOrder
    
    var questionsOrderStrategy: QuestionOrderStrategy {
        switch questionsOrder {
        case .successively:
            return QuestionsOrderSuccessivelyStrategy()
        case .random:
            return QuestionsOrderRandomStrategy()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // добавляем вопросы в массив
        addQuestions()
        // отработка стратегии
        questionArr = questionsOrderStrategy.questionOrder(questionArr: questionArr)
        
        getAnswer(i: rightAnswersCount)
        
        
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
            geameSession.ratio = geameSession.rightAnswersCount / geameSession.allQuestions * 100
            //            game.gameSessions?.cashResult = cashResult
            //            game.gameSessions?.rightAnswersCount = rightAnswersCount
            //            game.gameSessions?.allQuestions = questionArr.count
            //            game.gameSessions = geameSession
            
        } else {
            
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
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
            geameSession.ratio = geameSession.rightAnswersCount / geameSession.allQuestions * 100
            
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
            geameSession.ratio = geameSession.rightAnswersCount / geameSession.allQuestions * 100
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
            geameSession.ratio = rightAnswersCount / questionArr.count * 100
            
        } else {
            
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func ExitButtonAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "",
                                      message: "Вы уверены, что хотите покинуть игру?",
                                      preferredStyle: .alert)
        let actionYes = UIAlertAction(title: "Да",
                                      style: .cancel,
                                      handler: {action in  self.delegate?.didEndGame(withResult: self.geameSession)
            self.game.addRecord(self.geameSession)
            self.dismiss(animated: true, completion: nil)})
        
        let actionNo = UIAlertAction(title: "Нет",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        self.present(alert, animated: true,completion: nil)
        
        
    }
    
    
    // MARK: - Добовляем вопросы в игру
    func addQuestions() {
        
        questionArr = game.questions
        
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
        
        
    }
    
    //    MARK: - первый вопрос
    func getAnswer (i: Int) {
        
        textQuestion.text = questionArr[i].textQuestion
        answerA.text = "\( questionArr[i].answerOptions["A"] ?? "")"
        answerB.text = "\( questionArr[i].answerOptions["B"] ?? "")"
        answerC.text = "\( questionArr[i].answerOptions["C"] ?? "")"
        answerD.text = "\( questionArr[i].answerOptions["D"] ?? "")"
        
        resultLable.text = "Текущий результат игры: \(cashResult)"
    }
    
    //    MARK: - следующие вопросы
    func getNextAnswer (i: Int) {
        
        if i < (questionArr.count) {
            
            textQuestion.text = questionArr[i].textQuestion
            answerA.text = "\( questionArr[i].answerOptions["A"] ?? "")"
            answerB.text = "\( questionArr[i].answerOptions["B"] ?? "")"
            answerC.text = "\( questionArr[i].answerOptions["C"] ?? "")"
            answerD.text = "\( questionArr[i].answerOptions["D"] ?? "")"
            
            geameSession.cashResult = cashResult
            geameSession.rightAnswersCount = rightAnswersCount + 1 // не подтягивается
            geameSession.allQuestions = questionArr.count
            geameSession.ratio = geameSession.rightAnswersCount / geameSession.allQuestions * 100
            resultLable.text = "Текущий результат игры: \(cashResult)"
            
        } else {
            
            geameSession.rightAnswersCount = rightAnswersCount
            geameSession.cashResult = cashResult
            self.delegate?.didEndGame(withResult: geameSession)
            game.addRecord(geameSession)
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    // MARK: - Окончание игры
    func didEndGame(withResult result: GameSession) {
        
        self.delegate?.didEndGame(withResult: result)
        self.dismiss(animated: true, completion: nil)
    }
}
