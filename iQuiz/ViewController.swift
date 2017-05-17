//
//  ViewController.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/2/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dataTable: UITableView!
    var allQuizzes: [QuizType] = []
    
    // Mathematics, Marvel Super Heroes, and Science
    let objects = [
        ["title": "Mathematics",
         "desc": "Problems faced when x meets y",
         "icon": "math.png"],
        ["title": "Marvel Super Heroes",
         "desc": "It's clobberin' time!",
         "icon": "hero.png"],
        ["title": "Science",
         "desc": "Chemical X",
         "icon": "science.png"]
    ]
    var fetchedJSON: Array<AnyObject>? = nil
    
    var dataUrl = "http://tednewardsandbox.site44.com/questions.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchDataFromURL()
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
        
        if (self.allQuizzes.count != 0) {
            mainCell.icon.image = UIImage(named: "science.png")
            mainCell.title.text = self.allQuizzes[indexPath.row].quizName
            mainCell.title.sizeToFit()
            mainCell.desc.text = self.allQuizzes[indexPath.row].quizDesc
            mainCell.desc.sizeToFit()
        }
        
        return mainCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionViewController
        questionController.allQuizzes = self.allQuizzes
        questionController.currentQuiz = allQuizzes[(tableView.indexPathForSelectedRow!.row)]
        self.present(questionController, animated: true, completion: nil)
        
    }

    
    @IBAction func settingsAlertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Fetch quiz from URL", preferredStyle: UIAlertControllerStyle.alert)
        let defaults = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alert.addTextField{ (url : UITextField!) in
            url.placeholder = "Quiz URL..."
        }
        
        let processURL : UIAlertAction = UIAlertAction(title: "Check Now", style: .default, handler: { (action) -> Void in
            if (alert.textFields?.first?.text! != "") {
                self.dataUrl = (alert.textFields?.first?.text!)!
            }
            self.fetchDataFromURL()
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(processURL)
        alert.addAction(defaults)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fetchDataFromURL() {
        let url = URL(string: self.dataUrl)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                if let content = data {
                    do {
                        self.fetchedJSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? Array<AnyObject>
                        self.constructQuizesFromFetchedJSON()
                        //print(self.fetchedJSON!)
                    } catch {
                        print ("JSON Failed")
                    }
                }
            }
        }
        task.resume()
    }
    
    func constructQuizesFromFetchedJSON() {
        var allQuiz = [QuizType]()
        for i in 0...self.fetchedJSON!.count-1 {
            let currentJSON = self.fetchedJSON![i]
            let newQuiz : QuizType = QuizType()
            newQuiz.quizName = currentJSON["title"] as! String
            newQuiz.quizDesc = currentJSON["desc"] as! String
            let questions = currentJSON["questions"] as! Array<AnyObject>
            for q in 0...questions.count-1 {
                let currentQuestion = questions[q]
                let question = currentQuestion["text"] as! String
                let answer = currentQuestion["answer"] as! String
                let answerOptions = currentQuestion["answers"] as! Array<String>
                let newQuestion : Question = Question(question: question, answers: answerOptions, correctAnswer: Int(answer)!)
                newQuiz.questions.append(newQuestion)
            }
            allQuiz.append(newQuiz)
        }
        self.allQuizzes = allQuiz
        self.dataTable.reloadData()
    }
    
    // Constructs quizes from offline data
    func constructQuizesFromData() {
        var allQuiz = [QuizType]()
        for eachQuizData in self.objects {
            let newQuiz : QuizType = QuizType()
            newQuiz.quizName = eachQuizData["title"]!
            newQuiz.quizDesc = eachQuizData["desc"]!
            let newQuestion : Question = Question(question: "Whats up?", answers: ["Life", "Life2", "Life3", "Life4"], correctAnswer: 1)
            newQuiz.questions.append(newQuestion)
            allQuiz.append(newQuiz)
        }
        self.allQuizzes = allQuiz
        
    }
    
}

