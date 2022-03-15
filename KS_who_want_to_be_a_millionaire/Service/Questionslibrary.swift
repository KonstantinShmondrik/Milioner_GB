//
//  Questionslibrary.swift
//  KS_who_want_to_be_a_millionaire
//
//  Created by Константин Шмондрик on 28.02.2022.
//

import Foundation

class Questionslibrary {
    
    var question1 = Question(textQuestion: "Откуда обычно достает подарки Дед Мороз?",
                             answerOptions: ["A" : "из шкатулки",
                                             "B" : "из мешка",
                                             "C" : "из-за пазухи",
                                             "D" : "из интернет магазина"],
                             rightAnswer: "из мешка")
    
    var question2 = Question(textQuestion: "Какой элемент есть в конструции башенного крана?",
                             answerOptions: ["A" : "стрела",
                                             "B" : "копье",
                                             "C" : "дротик",
                                             "D" : "бумеранг"],
                             rightAnswer: "стрела")
    
    var question3 = Question(textQuestion: "Какое насекомое вызвало короткое замыкание в ранней версии вычислительной машины, тем самым породив термин «компьютерный баг» («баг» в переводе с англ. «насекомое»)?",
                             answerOptions: ["A" : "Мотылек",
                                             "B" : "Таракан",
                                             "C" : "Муха",
                                             "D" : "Японский хрущик"],
                             rightAnswer: "Мотылек")
    
    var question4 = Question(textQuestion: "Из каких плодов можно получить копру?",
                             answerOptions: ["A" : "Ананас",
                                             "B" : "Вишня",
                                             "C" : "Кокос",
                                             "D" : "Абрикос"],
                             rightAnswer: "Кокос")
    
    var question5 = Question(textQuestion: "Какой химический элемент составляет более половины массы тела человека?",
                             answerOptions: ["A" : "Углерод",
                                             "B" : "Кальций",
                                             "C" : "Кислород",
                                             "D" : "Железо"],
                             rightAnswer: "Кислород")
    
    var question6 = Question(textQuestion: "Какую часть тела также называют «атлант»?",
                             answerOptions: ["A" : "Головной мозг",
                                             "B" : "Шестая пара ребер",
                                             "C" : "Шейный позвонок",
                                             "D" : "Часть плеча"],
                             rightAnswer: "Шейный позвонок")
    
    var question7 = Question(textQuestion: "Сколько кубиков в кубике Рубика?",
                             answerOptions: ["A" : "22",
                                             "B" : "24",
                                             "C" : "26",
                                             "D" : "28"],
                             rightAnswer: "26")
    
    var question8 = Question(textQuestion: "Что изображено на заднем плане картины Леонардо да Винчи «Мона Лиза»?",
                             answerOptions: ["A" : "Драпировка",
                                             "B" : "Пейзаж",
                                             "C" : "Город",
                                             "D" : "Стадо овец"],
                             rightAnswer: "Пейзаж")
    
    var question9 = Question(textQuestion: "Что означает гавайское слово «вики», которое дало название интернет-энциклопедии «Википедия»?",
                             answerOptions: ["A" : "Простой",
                                             "B" : "Быстрый",
                                             "C" : "Изученный",
                                             "D" : "Маленький"],
                             rightAnswer: "Быстрый")
    
    var question10 = Question(textQuestion: "Какая единица измерения названа в честь итальянского дворянина?",
                              answerOptions: ["A" : "Паскаль",
                                              "B" : "Ом",
                                              "C" : "Вольт",
                                              "D" : "Герц"],
                              rightAnswer: "Вольт")
    
    
    var question11: [Question] = [Question(textQuestion: "",
                               answerOptions: ["A" : "",
                                               "B" : "",
                                               "C" : "",
                                               "D" : ""],
                               rightAnswer: ""),
                      Question(textQuestion: "",
                                                 answerOptions: ["A" : "",
                                                                 "B" : "",
                                                                 "C" : "",
                                                                 "D" : ""],
                                                 rightAnswer: "")
    ]
    
}
