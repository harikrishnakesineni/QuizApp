//
//  ContentView.swift
//  QuizzApp
//
//  Created by Hari krishna on 22/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizVM = QuizViewModel()
   
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [.green, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    TimerCountdownView()
                    
                    Text("Question \(quizVM.currentQuestion()) of \(quizVM.totalQuestions())")
                        .padding()
                        .textStyle(size: 20)
                    
                    Text(quizVM.model.quizModel.question)
                        .textStyle(size: 25)
                        
                    Image(quizVM.model.quizModel.questionImage)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    ChoiceGridView(quizVM: quizVM)
                    
                }
                
                
            }.navigationTitle("Wild Turkey Quiz")
                .navigationBarBackButtonHidden(true) 
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
