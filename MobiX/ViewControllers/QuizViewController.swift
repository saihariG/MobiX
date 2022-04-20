//
//  QuizViewController.swift
//  MobiX
//
//  Created by Sai Hari on 16/04/22.
//

import UIKit
import GameKit


class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    var seconds = 600
    var timer = Timer()
    
    let allQuestions = QuestionBank()
   
    
    var QuestionNo : Int = 0
    var correctAns: Int = 0
    var score : Int = 0
        
    var prevUsedNos : [Int] = []
    var currentQuestion : Question? = nil
    var askedQuestions : [Question]? = []
    
    var alreadyAsked = HashSet<String>()
    
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var questionEmptyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "0 / 10"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain ,
                                                               target : self , action: #selector(nextClick))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        retryBtn.isHidden = true
        questionEmptyLabel.isHidden = true
        
        loadNewQuestion()
        
        timerLabel.text = timerString(time: TimeInterval(seconds))
        startTimer()
    }
   
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        if seconds < 1 {
            timer.invalidate()
            finishQuiz()
        }
        else {
            seconds -= 1
            timerLabel.text = timerString(time: TimeInterval(seconds))
        }
    }
    
    func timerString(time : TimeInterval) -> String {
        let mins = Int(time) / 60 % 60
        let secs = Int(time) % 60
        
        return String(format: "%02i : %02i",mins,secs)
    }
    
    func emptyView() {
        title = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        questionLabel.isHidden = true
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        timerLabel.isHidden = true
        
        questionEmptyLabel.isHidden = false
        retryBtn.isHidden = false
    }
    
    @IBAction func retryClick(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "QuizBoardViewController")
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getRandomQuestion() -> [String] {
        
        if allQuestions.questions.isEmpty {
            emptyView()
            print("No Questions to Fetch")
            return []
        }
        
        var ans : [String] = []
        
        let randomNo = GKRandomSource.sharedRandom().nextInt(upperBound: allQuestions.questions.count)
        let q  : String = allQuestions.questions[randomNo].questionTxt
        
        if !alreadyAsked.contains(q) {
           
            alreadyAsked.insert(allQuestions.questions[randomNo].questionTxt)
            ans.append(allQuestions.questions[randomNo].questionTxt)
            ans.append(allQuestions.questions[randomNo].optionA)
            ans.append(allQuestions.questions[randomNo].optionB)
            ans.append(allQuestions.questions[randomNo].optionC)
            ans.append(allQuestions.questions[randomNo].optionD)
            ans.append( String(allQuestions.questions[randomNo].correctAnswerIdx))
            return ans
        }
                
        var newRand = GKRandomSource.sharedRandom().nextInt(upperBound: allQuestions.questions.count)
        
        while(alreadyAsked.contains(allQuestions.questions[newRand].questionTxt)) {
            newRand = GKRandomSource.sharedRandom().nextInt(upperBound: allQuestions.questions.count)
        }
        
        alreadyAsked.insert(allQuestions.questions[newRand].questionTxt)
        ans.append(allQuestions.questions[newRand].questionTxt)
        ans.append(allQuestions.questions[newRand].optionA)
        ans.append(allQuestions.questions[newRand].optionB)
        ans.append(allQuestions.questions[newRand].optionC)
        ans.append(allQuestions.questions[newRand].optionD)
        ans.append( String(allQuestions.questions[newRand].correctAnswerIdx))
        
        return ans
    }
    
    func resetUI() {
            //print("resetting UI...")
            option1.setTitleColor(.systemBlue, for: .normal)
            option2.setTitleColor(.systemBlue, for: .normal)
            option3.setTitleColor(.systemBlue, for: .normal)
            option4.setTitleColor(.systemBlue, for: .normal)
    }
    
    func loadNewQuestion() {
        if(QuestionNo < 10) {
            
            var questionProperties : [String] = []
            resetUI()
            questionProperties = getRandomQuestion()
            
            if questionProperties.isEmpty {
               return
            }
            
            let asked = Question(questionTxt: questionProperties[0], optionA: questionProperties[1], optionB: questionProperties[2], optionC: questionProperties[3], optionD: questionProperties[4], correctAnsIdx: Int(questionProperties[5])!, selectedAnsIdx: -1, currScore: 0)
            askedQuestions!.append(asked) // currentQuestion!
            currentQuestion = asked
           
            //print("asked prop : \(asked.questionTxt)")
            //print("\(QuestionNo) : \(askedQuestions![QuestionNo].questionTxt)")
            print("\(QuestionNo) : \(questionProperties[0])")
            
            if QuestionNo == 0 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            }
            else if QuestionNo == 9 {
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(finishQuiz))
            }
            else {
                navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous", style: .plain, target: self, action: #selector(prevClick))
            }
            
            self.title = "\(QuestionNo+1) / 10"
            
            questionLabel.text = questionProperties[0]
            option1.setTitle(questionProperties[1], for: .normal)
            option2.setTitle(questionProperties[2], for: .normal)
            option3.setTitle(questionProperties[3], for: .normal)
            option4.setTitle(questionProperties[4], for: .normal)
            correctAns = Int(questionProperties[5])!
    
        }
        
    }
 
    
    @IBAction func option1Click(_ sender: Any) {
        
        askedQuestions![QuestionNo].selectedAnswerIdx = 1
        currentQuestion?.selectedAnswerIdx = 1
        checkAnswer(selectedOption: currentQuestion!.selectedAnswerIdx)
        updateSelected()
    }
    
    @IBAction func option2Click(_ sender: Any) {
     
        askedQuestions![QuestionNo].selectedAnswerIdx = 2
        currentQuestion?.selectedAnswerIdx = 2
        checkAnswer(selectedOption: currentQuestion!.selectedAnswerIdx)
        updateSelected()
    }
    
    @IBAction func option3Click(_ sender: Any) {
    
        askedQuestions![QuestionNo].selectedAnswerIdx = 3
        currentQuestion?.selectedAnswerIdx = 3
        checkAnswer(selectedOption: currentQuestion!.selectedAnswerIdx)
        updateSelected()
    }
    
    @IBAction func option4Click(_ sender: Any) {
      
        askedQuestions![QuestionNo].selectedAnswerIdx = 4
        currentQuestion?.selectedAnswerIdx = 4
        checkAnswer(selectedOption: currentQuestion!.selectedAnswerIdx)
        updateSelected()
    }
   
    
    func updateSelected() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextClick))
        
        if(QuestionNo == 0) {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        }
        else if QuestionNo == 9 {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(finishQuiz))
        }
                
        if QuestionNo != 0 {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous", style: .plain, target: self, action: #selector(prevClick))
        }
        

        if(currentQuestion?.selectedAnswerIdx == 1) {
        
            option1.setTitleColor(.black, for: .normal)
            option2.setTitleColor(.systemBlue, for: .normal)
            option3.setTitleColor(.systemBlue, for: .normal)
            option4.setTitleColor(.systemBlue, for: .normal)
            return
        }
        else if(currentQuestion?.selectedAnswerIdx == 2) {
           
            option1.setTitleColor(.systemBlue, for: .normal)
            option2.setTitleColor(.black, for: .normal)
            option3.setTitleColor(.systemBlue, for: .normal)
            option4.setTitleColor(.systemBlue, for: .normal)
            return
        }
        else if(currentQuestion?.selectedAnswerIdx == 3) {
          
            option1.setTitleColor(.systemBlue, for: .normal)
            option2.setTitleColor(.systemBlue, for: .normal)
            option3.setTitleColor(.black, for: .normal)
            option4.setTitleColor(.systemBlue, for: .normal)
            return
        }
        else if(currentQuestion?.selectedAnswerIdx == 4) {
           
            option1.setTitleColor(.systemBlue, for: .normal)
            option2.setTitleColor(.systemBlue, for: .normal)
            option3.setTitleColor(.systemBlue, for: .normal)
            option4.setTitleColor(.black, for: .normal)
            return
        }
        
        
    }
    
    func checkAnswer(selectedOption : Int) {
        
        if selectedOption == correctAns {
            
            if askedQuestions![QuestionNo].currentScore == 0 {
                askedQuestions![QuestionNo].currentScore = 1
                score = score + 1
            }
            
        }
        else {
            // print("wrong")
            if(askedQuestions![QuestionNo].currentScore > 0) {
              askedQuestions![QuestionNo].currentScore = 0
              score = score - 1
            }
        }
        
        print("score : \(score)")

    }
    
    @objc func nextClick() {
        QuestionNo += 1
        if(QuestionNo <= askedQuestions!.count-1) {
           loadNextQuestion()
        }else {
           loadNewQuestion()
        }
    }

    @objc func prevClick() {
            QuestionNo -= 1;
            loadPrevQuestion()
    }

    func loadNextQuestion() {
        
        if(QuestionNo == 9) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(finishQuiz))
        }
        
        self.title = "\(QuestionNo+1) / 10"
        currentQuestion = askedQuestions![QuestionNo]
        questionLabel.text =  askedQuestions![QuestionNo].questionTxt
        option1.setTitle(askedQuestions![QuestionNo].optionA, for: .normal)
        option2.setTitle(askedQuestions![QuestionNo].optionB, for: .normal)
        option3.setTitle(askedQuestions![QuestionNo].optionC, for: .normal)
        option4.setTitle(askedQuestions![QuestionNo].optionD, for: .normal)
        correctAns = askedQuestions![QuestionNo].correctAnswerIdx
    
        if(askedQuestions![QuestionNo].selectedAnswerIdx == -1) {
            resetUI()
        }
        
        updateSelected()
    }
    
    func loadPrevQuestion() {
        self.title = "\(QuestionNo+1) / 10"
        
        if(QuestionNo == 0 || title == "1 / 10") {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        }
        
        currentQuestion = askedQuestions![QuestionNo]
        questionLabel.text =  askedQuestions![QuestionNo].questionTxt
        option1.setTitle(askedQuestions![QuestionNo].optionA, for: .normal)
        option2.setTitle(askedQuestions![QuestionNo].optionB, for: .normal)
        option3.setTitle(askedQuestions![QuestionNo].optionC, for: .normal)
        option4.setTitle(askedQuestions![QuestionNo].optionD, for: .normal)
        correctAns = askedQuestions![QuestionNo].correctAnswerIdx
   
        if askedQuestions![QuestionNo].selectedAnswerIdx == -1 {
            resetUI()
        }
        
        updateSelected()
    }
    
    @objc func finishQuiz() {
        performSegue(withIdentifier: "showResult", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let vc = segue.destination as! ResultViewController
            vc.score = score
        }
    }
}
