//
//  ChoiceGridView.swift
//  QuizzApp
//
//  Created by Hari krishna on 24/04/23.
//

import SwiftUI

struct ChoiceGridView: View {
    var quizVM: QuizViewModel
    var columns: [GridItem] = [
        GridItem(.fixed(170), spacing: 10),
        GridItem(.fixed(170), spacing: 10)
        
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(quizVM.model.quizModel.choicelist) { choice in
              
                NavigationLink(destination: ResultView(quizVM: quizVM, isCorrect: choice.isCorrected)) {
                    Label(choice.choiceText, systemImage: choice.systemImage)
                        .textStyle(size: 30)
                        .frame(width: 170, height: 50)
                        .background(choice.bgColor)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ChoiceGridView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceGridView(quizVM: QuizViewModel())
    }
}
