//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/9/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var allQuizzes : [QuizType] = []
    var currentQuiz: QuizType = QuizType()
    var userSelectedAnswers: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = currentQuiz.questions[userSelectedAnswers.count - 1].question
        
        let answers : [String] = currentQuiz.questions[userSelectedAnswers.count - 1].answers
        let correctNumber = currentQuiz.questions[userSelectedAnswers.count - 1].correctAnswer - 1
        
        if ((userSelectedAnswers[userSelectedAnswers.count - 1]) == currentQuiz.questions[userSelectedAnswers.count - 1].correctAnswer) {
            answerLabel.text = "You got it right. The correct answer was \(answers[correctNumber])."
        } else {
            answerLabel.text = "You got it wrong. The correct answer was \(answers[correctNumber])."
        }
        answerLabel.sizeToFit()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if (self.userSelectedAnswers.count < self.currentQuiz.questions.count) {
            let questionController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionViewController
            questionController.allQuizzes = self.allQuizzes
            questionController.currentQuiz = self.currentQuiz
            questionController.userSelectedAnswers = self.userSelectedAnswers
            self.present(questionController, animated: true, completion: nil)
        } else {
            let resultController = self.storyboard?.instantiateViewController(withIdentifier: "FinishVC") as! FinishedViewController
            resultController.allQuizzes = self.allQuizzes
            resultController.currentQuiz = self.currentQuiz
            resultController.userSelectedAnswers = self.userSelectedAnswers
            self.present(resultController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
