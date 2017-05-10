//
//  ViewController.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/2/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var allQuizzes: [QuizType] = []
    
    // Mathematics, Marvel Super Heroes, and Science
    let objects = [
        ["title": "Mathematics",
         "desc": "Problems faced when x meets y",
         "icon": "math.png",
         "questions": [[
            "text":"Who is Iron Man?",
            "answer":"1",
            "answers": [
                "Tony Stark",
                "Obadiah Stane",
                "A rock hit by Megadeth",
                "Nobody knows"
            ]
        ]]],
        ["title": "Marvel Super Heroes",
         "desc": "It's clobberin' time!",
         "icon": "hero.png",
         "questions": [[
            "text":"Who is Iron Man?",
            "answer":"1",
            "answers": [
                "Tony Stark",
                "Obadiah Stane",
                "A rock hit by Megadeth",
                "Nobody knows"
            ]
        ]]],
        ["title": "Science",
         "desc": "Chemical X",
         "icon": "science.png",
         "questions": [[
            "text":"Who is Iron Man?",
            "answer":"1",
            "answers": [
                "Tony Stark",
                "Obadiah Stane",
                "A rock hit by Megadeth",
                "Nobody knows"
            ]
        ]]]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.constructQuizesFromData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! ViewControllerTableViewCell
        mainCell.icon.image = UIImage(named: objects[indexPath.row]["icon"] as! String!)
        mainCell.title.text = objects[indexPath.row]["title"] as! String!
        mainCell.title.sizeToFit()
        mainCell.desc.text = objects[indexPath.row]["desc"] as! String!
        mainCell.desc.sizeToFit()
        return mainCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let questionController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionViewController
        questionController.allQuizzes = self.allQuizzes
        questionController.currentQuiz = allQuizzes[(tableView.indexPathForSelectedRow!.row)]
        self.present(questionController, animated: true, completion: nil)
        
    }
    
    @IBAction func settingsAlertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func constructQuizesFromData() {
        var allQuiz = [QuizType]()
        for eachQuizData in self.objects {
            print(eachQuizData)
            let newQuiz : QuizType = QuizType()
            newQuiz.quizName = eachQuizData["title"] as! String!
            newQuiz.quizDesc = eachQuizData["desc"] as! String!
            /*for question in eachQuizData["questions"]! {
                let newQuestion : Question = Question(question: question["text"].stringValue, answers: question["answers"].arrayValue, correctAnswer: question["answer"].intValue)
                newQuiz.questions.append(newQuestion)
                print(question)
            }*/
            allQuiz.append(newQuiz)
        }
        self.allQuizzes = allQuiz
    }
    
}

