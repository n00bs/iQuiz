//
//  QuizType.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/9/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import Foundation

class QuizType {
    
    var quizName : String
    var quizDesc : String
    var questions : [Question]
    
    convenience init() {
        self.init(quizName: "", quizDesc: "", questions: [])
    }
    
    init(quizName: String, quizDesc: String, questions: [Question]) {
        self.quizName = quizName
        self.quizDesc = quizDesc
        self.questions = questions
    }
}
