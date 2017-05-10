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
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var correct = 0
        for i in 0...(currentQuiz.questions.count - 1) {
            if (userSelectedAnswers[i] == (currentQuiz.questions[i].correctAnswer)) {
                correct += 1
            }
        }
        scoreLabel.text = "Score = \(correct) out of  \(currentQuiz.questions.count)"
        if (correct == currentQuiz.questions.count) {
            DescriptionLabel.text = "Amazing! You aced the quiz!"
        } else {
            DescriptionLabel.text = "Good attempt"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "mainVC", sender: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "mainVC") {
            let viewController = segue.destination as! ViewController
            viewController.allQuizzes = self.allQuizzes
        }
        
    }
}
