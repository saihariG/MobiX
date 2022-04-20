//
//  QuizBoardViewController.swift
//  MobiX
//
//  Created by Sai Hari on 16/04/22.
//

import UIKit

class QuizBoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Instructions"
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    @IBAction func startClick(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "QuizViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
