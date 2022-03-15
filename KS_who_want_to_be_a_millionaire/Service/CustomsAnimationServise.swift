//
//  File.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

// Библиотека интерфейсов и анимаций

import UIKit

class CustomsAnimationServise {
    
    //    MARK: - анимация нажатия на кнопку ответов
    func clickButton (button: UIView) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.9
        animation.toValue = 1
        animation.stiffness = 100
        animation.mass = 2
        animation.duration = 0.5
        animation.beginTime = CACurrentMediaTime() + 0.1
        animation.fillMode = CAMediaTimingFillMode.backwards
        button.layer.add(animation, forKey: nil)
    }
    
    //    MARK: - изменение кнопки ответа при верном ответе (пока не применяется)
    func righteAnswer(button: UIView) {
        button.backgroundColor = .green
        
    }
    
    //    MARK: - изменение кнопки ответа при неверном ответе (пока не применяется)
    func wrongAnswer(button: UIView) {
        button.backgroundColor = .red
        
    }
    
    //    MARK: - интерфейс кнопок ответов
    func setButtonView(button: UIView!) {
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.5
        button.clipsToBounds = true
        button.layer.cornerRadius = button.frame.width / 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 7
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowOpacity = 0.5
        button.backgroundColor = .systemGray2
    }
    
    //    MARK: - интерфейс поля с вопросом
    func setTextFoneView(textFoneView: UIView!) {
        
        textFoneView.layer.borderColor = UIColor.gray.cgColor
        textFoneView.layer.borderWidth = 0.5
        textFoneView.clipsToBounds = true
        textFoneView.layer.cornerRadius = textFoneView.frame.width / 8
        textFoneView.layer.shadowColor = UIColor.black.cgColor
        textFoneView.layer.shadowRadius = 7
        textFoneView.layer.shadowOffset = CGSize.zero
        textFoneView.layer.shadowOpacity = 0.5
        textFoneView.backgroundColor = .systemGray
        
    }
    
}
