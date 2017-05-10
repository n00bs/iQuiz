//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/9/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    var allQuizzes : [QuizType] = []
    var currentQuiz: QuizType = QuizType()
    var userSelectedAnswers: [Int] = []
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var correct = 0
        for i in 0...(currentQuiz.questions.count - 1) {
            if (userSelectedAnswers[i] == (currentQuiz.questions[i].correctAnswer)) {
                correct += 1
            }
        }
        scoreLabel.text = "Score = \(correct) out of \(currentQuiz.questions.count)"
        if (correct == currentQuiz.questions.count) {
            descLabel.text = "Amazing! You aced the quiz!"
        } else {
            descLabel.text = "Good attempt"
        }
        scoreLabel.sizeToFit()
        descLabel.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
