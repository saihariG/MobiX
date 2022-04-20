//
//  QuestionBank.swift
//  MobiX
//
//  Created by Sai Hari on 17/04/22.
//

import Foundation
class QuestionBank {
    
    var questions = [Question]()
    
    init() {
        questions.append(Question(questionTxt: "Which data-structure uses LIFO?", optionA: "Arrays", optionB: "Int", optionC: "Stacks", optionD: "Queues", correctAnsIdx: 3,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "Int holds decimal numbers", optionA: "True", optionB: "False", optionC: "Neither is correct", optionD: "Either is correct", correctAnsIdx: 1,selectedAnsIdx: -1,currScore: 0))
            
        questions.append(Question(questionTxt: "What dose this equation mean ? a != t", optionA: "a is assigned to t", optionB: "a and t are equal", optionC: "t is add to a", optionD: "a not equals t", correctAnsIdx: 4,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "What command do you use to output data to the screen?", optionA: "cin>>", optionB: "cout<<", optionC: "cin<<", optionD: "cout>>", correctAnsIdx: 2,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "A short sections of code written to complete a task ____" , optionA: "Arrays", optionB: "Buffer", optionC: "function", optionD: "loop", correctAnsIdx: 3,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "Which of the following is not a programming language?", optionA: "BrainFuck", optionB: "Java", optionC: "Kotlin", optionD: "Anaconda", correctAnsIdx: 4,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "What are people who write computer code called", optionA: "Manufacturers", optionB: "Architects", optionC: "Programmers", optionD: "Plumbers", correctAnsIdx: 3,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "What is computer coding?", optionA: "Tv Show", optionB: "Telling computer what to do", optionC: "Radio show", optionD: "A process", correctAnsIdx: 2,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "What do shell windows show in python?", optionA: "program output", optionB: "print command is shown", optionC: "cpu usage", optionD: "code appears in code window", correctAnsIdx: 1,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "Interpreter is used at ____", optionA: "build time", optionB: "run time", optionC: "compile time", optionD: "All", correctAnsIdx: 2,selectedAnsIdx: -1,currScore: 0))
        
       questions.append(Question(questionTxt: "The process by which one object can acquire the properties of another object is ____", optionA: "Encapsulation", optionB: "Inheritance", optionC: "polymorphism", optionD: "Abstraction", correctAnsIdx: 2,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "Pick the term that relates to polymorphism:", optionA: "static allocation", optionB: "dynamic binding", optionC: "static typing", optionD: "dynamic allocation", correctAnsIdx: 2,selectedAnsIdx: -1,currScore: 0))
        
        
        questions.append(Question(questionTxt: "The keyword which is used to access the method or member variables from the superclass:", optionA: "super", optionB: "using", optionC: "self", optionD: "this", correctAnsIdx: 1,selectedAnsIdx: -1,currScore: 0))
        
        questions.append(Question(questionTxt: "Constructors are used to ____", optionA: "free memory", optionB: "build UI", optionC: "create subclass", optionD: "Initialize", correctAnsIdx: 4,selectedAnsIdx: -1,currScore: 0))
        
        
        questions.append(Question(questionTxt: "An object that has more than one form is referred to as:", optionA: "Abstract class", optionB: "Inheritance", optionC: "Interface", optionD: "Polymorphism", correctAnsIdx: 4,selectedAnsIdx: -1,currScore: 0))
    }
    

}
