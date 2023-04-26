//
//  ResultView.swift
//  QuizzApp
//
//  Created by Hari krishna on 23/04/23.
//

import SwiftUI

struct ResultView: View {
    var quizVM: QuizViewModel
    var isCorrect: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    if isCorrect {
                        Image("turkey")
                            .resizable()
                            .scaledToFit()
                        Text("You got it right")
                            .textStyle(size: 40)
                        
                        let _ = quizVM.gotItCorrect()
                        
                    } else {
                        Image("turkey")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Better luck next time")
                            .textStyle(size: 40)
                    }
                    
                    if quizVM.allDone() {
                        VStack {
                            
                            Text("You are done with the quiz.")
                                .textStyle(size: 30)
                            
                            Text("You got \(quizVM.howManyCorrect()) questions right.")
                                .textStyle(size: 25)
                                .padding(.bottom, 20)
                            
                            Button {
                                
                            } label: {
                                NavigationLink(destination: ContentView()) {
                                    Text("Retake")
                                }
                            }
                            .frame(width: 200, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(10)
                            
                        }.padding(.top, 30)
                    } else {
                        NavigationLink(destination: ContentView(quizVM: quizVM).onAppear{ quizVM.nextQuestion()}) {
                            Text("Next question")
                                .textStyle(size: 30)
                                .frame(width: 230, height: 50)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(quizVM: QuizViewModel(), isCorrect: false)
    }
}
