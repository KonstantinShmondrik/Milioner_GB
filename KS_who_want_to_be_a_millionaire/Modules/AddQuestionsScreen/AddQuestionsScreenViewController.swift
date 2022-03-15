//
//  AddQuestionsScreenViewController.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 14.03.2022.
//

import UIKit

enum MessageEnum: String {
    case isEmpty = "Остались незаполненные поля"
    case isMatch = "Верный ответ не соответвует ни одному из вариантов ответов"
    case isSaved = "Ваш вопрос сохранен"
    
}

class AddQuestionsScreenViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var answerBTextField: UITextField!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var answerDTextField: UITextField!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    @IBOutlet weak var saveQuestionButton: UIButton!
    
    var game = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown (notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0.0,
                                         left: 0.0,
                                         bottom: kbSize.height,
                                         right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        
        self.scrollView?.endEditing(true)
    }
    
    
    @IBAction func saveQuestionButtonAction(_ sender: Any) {
        
        saveQuestion()
    }
    
    private func saveQuestion() {
        
        let question = questionTextField.text
        let answerA = answerATextField.text
        let answerB = answerBTextField.text
        let answerC = answerCTextField.text
        let answerD = answerDTextField.text
        let rightAnswer = rightAnswerTextField.text
        
        let questionArr = Question(textQuestion: question ?? "",
                                   answerOptions: ["A" : answerA ?? "",
                                                   "B" : answerB ?? "",
                                                   "C" : answerC ?? "",
                                                   "D" : answerD ?? ""],
                                   rightAnswer: rightAnswer ?? "")
        
        if question == "" || answerA == "" || answerB == "" || answerC == "" || answerD == "" || rightAnswer == "" {
            
            self.showErrorAlert(MessageEnum.isEmpty.rawValue)
            
        } else if rightAnswer == answerA || rightAnswer == answerB || rightAnswer == answerC || rightAnswer == answerD {
            
            game.addQuestion(questionArr)
            showSavedAlert(MessageEnum.isSaved.rawValue)
            
            
        } else {
            
            self.showErrorAlert(MessageEnum.isMatch.rawValue)
        }
    }
    
    private func showErrorAlert(_ message: String){
        let alert = UIAlertController(title: "Ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: {action in print("кнопка алетрт нажата")})
        alert.addAction(action)
        self.present(alert, animated: true,completion: nil)
    }
    
    private func showSavedAlert(_ message: String){
        let alert = UIAlertController(title: "Поздравляем",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: {action in self.dismiss(animated: true, completion: nil)})
        alert.addAction(action)
        self.present(alert, animated: true,completion: nil)
    }
    
    
}
