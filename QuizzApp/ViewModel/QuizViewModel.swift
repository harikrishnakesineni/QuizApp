//
//  QuizViewModel.swift
//  QuizzApp
//
//  Created by Hari krishna on 23/04/23.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    static var currentQuestion = 0
    static var numberCorrect = 0
    @Published var model: Quiz
    
    init() {
        QuizViewModel.currentQuestion = 0
        QuizViewModel.numberCorrect = 0
        model = QuizViewModel.createQuizEngine(i: QuizViewModel.currentQuestion)
    }
    
    static func createQuizEngine(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    
    func gotItCorrect() {
        QuizViewModel.numberCorrect += 1
    }
    
    func howManyCorrect() -> Int {
        QuizViewModel.numberCorrect
    }
    
    func nextQuestion() {
        QuizViewModel.currentQuestion += 1
        
        if QuizViewModel.currentQuestion < QuizViewModel.quizData.count {
            self.model = QuizViewModel.createQuizEngine(i: QuizViewModel.currentQuestion)
        } else {
            print("No more question")
        }
    }
    
    func currentQuestion() -> Int {
        return QuizViewModel.currentQuestion + 1
    }
    
    func totalQuestions() -> Int {
        return QuizViewModel.quizData.count
    }
    
    func allDone() -> Bool {
        currentQuestion() == totalQuestions() ? true : false
    }
    
}

extension QuizViewModel {
    
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Wild turkeys live in every U.S. state except:", questionImage: "turkey",
                      choicelist: [
                        QuizChoice(systemImage: "square.fill", bgColor: .red, choiceText: "Chicago"),
                        QuizChoice(systemImage: "diamond.fill", bgColor: .orange, choiceText: "Idaho"),
                        QuizChoice(systemImage: "triangle.fill", bgColor: .blue, choiceText: "Virginia"),
                        QuizChoice(systemImage: "circle.fill", bgColor: .green, choiceText: "Alaska", isCorrected: true)
                      ]),
            
            QuizModel(question: "What is the male turkey called", questionImage: "threeturkeys",
                      choicelist: [
                        QuizChoice(systemImage: "square.fill", bgColor: .red, choiceText: "Rooster"),
                        QuizChoice(systemImage: "diamond.fill", bgColor: .orange, choiceText: "Fred"),
                        QuizChoice(systemImage: "triangle.fill", bgColor: .blue, choiceText: "Tom", isCorrected: true),
                        QuizChoice(systemImage: "circle.fill", bgColor: .green, choiceText: "Gander")
                      ])
        ]
    }
    
}
