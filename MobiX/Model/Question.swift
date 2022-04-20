//
//  Question.swift
//  MobiX
//
//  Created by Sai Hari on 16/04/22.
//

import Foundation

class Question {
 
    var questionTxt : String
    var optionA : String
    var optionB : String
    var optionC : String
    var optionD : String
    var correctAnswerIdx : Int
    var selectedAnswerIdx : Int
    var currentScore : Int
        
    
    init(questionTxt : String,optionA : String,optionB : String,optionC : String,optionD : String,correctAnsIdx : Int,selectedAnsIdx :Int,currScore : Int) {
        self.questionTxt = questionTxt
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.optionD = optionD
        self.correctAnswerIdx = correctAnsIdx
        self.selectedAnswerIdx = selectedAnsIdx
        self.currentScore = currScore
    }
    
    
    
}
