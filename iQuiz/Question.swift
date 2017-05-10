//
//  Question.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/9/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import Foundation

class Question {
    
    var question: String
    var answers: [String]
    var correctAnswer: Int
    
    init(question: String, answers: [String], correctAnswer: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
