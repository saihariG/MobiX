//
//  ViewController.swift
//  MobiX
//
//  Created by Sai Hari on 16/04/22.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    let allUsers = UserCredentials()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailField.delegate = self
        self.passField.delegate = self
        
        emailField.text = "saihari@mobicip.com"
        passField.text = "1234"
    }

    // To hide keyboard on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.emailField:
            self.passField.becomeFirstResponder()
        case self.passField:
            passField.resignFirstResponder()
        default:
            self.emailField.resignFirstResponder()
        }
    }
    

    @IBAction func loginClick(_ sender: Any) {

        let mail = emailField.text
        let pass = passField.text
        
        var i  = 0
        
        for k in 0...allUsers.users.count-1 {
            print(allUsers.users[k].mailID)
            if mail == allUsers.users[k].mailID {
                i = k
                print("registered")
                break
            }
            else {
                return
            }
        }
        
            
        if isValidEmailAddress(emailAddressString: mail!) {
            //print("valid mail \(mail!)")
            // if mail is valid , check password
            if pass == allUsers.users[i].password {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "QuizBoardViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                print("Invalid Password")
            }
        }
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
      
      var returnValue = true
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = emailAddressString as NSString
          let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue = false
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue = false
      }
      
      return returnValue
  }
    
    
}

