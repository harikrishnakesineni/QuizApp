//
//  TimerCountdownView.swift
//  QuizzApp
//
//  Created by Hari krishna on 25/04/23.
//

import SwiftUI

struct TimerCountdownView: View {
    @State private var currentScore = 1.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        
        ProgressView(value: currentScore)
            .onReceive(timer) { _ in
                if currentScore > 0 {
                    currentScore -= 0.01
                }
            }
    }
}

struct TimerCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountdownView()
    }
}
