//
//  QuizModel.swift
//  QuizzApp
//
//  Created by Hari krishna on 22/04/23.
//

import Foundation
import SwiftUI

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
}

struct QuizModel {
    var question: String
    var questionImage: String
    var choicelist: [QuizChoice]
}

struct QuizChoice: Identifiable {
    var id = UUID()
    var systemImage: String
    var bgColor: Color
    var choiceText: String
    var isCorrected: Bool = false
}


