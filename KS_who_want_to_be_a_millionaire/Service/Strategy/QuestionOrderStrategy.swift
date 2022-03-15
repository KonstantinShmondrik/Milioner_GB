//
//  QuestionOrderStrategy.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 14.03.2022.
//

import UIKit

protocol QuestionOrderStrategy {
    
    func questionOrder(questionArr: [Question]) -> [Question]
    
    
}
