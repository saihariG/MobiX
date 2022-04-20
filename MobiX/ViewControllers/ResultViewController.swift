//
//  ResultViewController.swift
//  MobiX
//
//  Created by Sai Hari on 17/04/22.
//

import UIKit

class ResultViewController: UIViewController {

    var score = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
        scoreLabel.text = "\(score) / 10"
        setFeedback()
        print("final score : \(score)")
    }
    
    func setFeedback() {
        if(score >= 8) {
            feedbackLabel.text = "You made it!"
        }
        else if(score >= 4 ){
            feedbackLabel.text = "Expect More!"
        }
        else {
            feedbackLabel.text = "Never give up!"
        }
    }
    
    
}
