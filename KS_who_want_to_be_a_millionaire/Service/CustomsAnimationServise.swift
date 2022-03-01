//
//  File.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import UIKit

class CustomsAnimationServise{
    
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
    
    func rhiteAnswer(button: UIView) {
        button.backgroundColor = .green
        
    }
    
    func wrongAnswer(button: UIView) {
        button.backgroundColor = .red
        
    }
}
