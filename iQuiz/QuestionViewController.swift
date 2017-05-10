//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/9/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var allQuizzes : [QuizType] = []
    var currentQuiz: QuizType = QuizType()
    var userSelectedAnswers: [Int] = []
    var currentAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentQuestion = currentQuiz.questions[userSelectedAnswers.count]
        questionLabel.text = currentQuestion.question
        option1.setTitle(currentQuestion.answers[0], for: .normal)
        option2.setTitle(currentQuestion.answers[1], for: .normal)
        option3.setTitle(currentQuestion.answers[2], for: .normal)
        option4.setTitle(currentQuestion.answers[3], for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func option1(_ sender: Any) {
        self.clearSelections()
        option1.isSelected = true
        currentAnswer = 1
    }
   
    @IBAction func option2(_ sender: Any) {
        self.clearSelections()
        option2.isSelected = true
        currentAnswer = 2
    }
   
    @IBAction func option3(_ sender: Any) {
        self.clearSelections()
        option3.isSelected = true
        currentAnswer = 3
    }
    
    @IBAction func option4(_ sender: Any) {
        self.clearSelections()
        option4.isSelected = true
        currentAnswer = 4
    }
    
    func clearSelections() {
        option1.isSelected = false
        option2.isSelected = false
        option3.isSelected = false
        option4.isSelected = false
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        if (option1.isSelected || option2.isSelected || option3.isSelected || option4.isSelected) {
            self.userSelectedAnswers.append(currentAnswer)
            let answerController = self.storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as! AnswerViewController
            answerController.allQuizzes = self.allQuizzes
            answerController.currentQuiz = self.currentQuiz
            answerController.userSelectedAnswers = self.userSelectedAnswers
            self.present(answerController, animated: true, completion: nil)
        } else {
            self.clearSelections()
            let alertController = UIAlertController(title: "Error", message: "Select one of the 4 options", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
}
