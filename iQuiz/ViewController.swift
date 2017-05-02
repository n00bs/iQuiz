//
//  ViewController.swift
//  iQuiz
//
//  Created by Abhishek Chauhan on 5/2/17.
//  Copyright © 2017 Abhishek Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // Mathematics, Marvel Super Heroes, and Science
    let objects = [
        ["title": "Mathematics", "desc": "Problems faced when x meets y", "icon": "math.png"],
        ["title": "Marvel Super Heroes", "desc": "It's clobberin' time!", "icon": "hero.png"],
        ["title": "Science", "desc": "Chemical X", "icon": "science.png"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        mainCell.icon.image = UIImage(named: objects[indexPath.row]["icon"]!)
        mainCell.title.text = objects[indexPath.row]["title"]!
        mainCell.title.sizeToFit()
        mainCell.desc.text = objects[indexPath.row]["desc"]!
        mainCell.desc.sizeToFit()
        return mainCell
    }
    
    @IBAction func settingsAlertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

