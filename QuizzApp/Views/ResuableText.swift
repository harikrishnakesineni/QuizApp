//
//  ResuableText.swift
//  QuizzApp
//
//  Created by Hari krishna on 24/04/23.
//

import SwiftUI

struct ResuableText: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.white)
    }
    
}
extension View {
    func textStyle(size: CGFloat) -> some View {
        self.modifier(ResuableText(size: size))
    }
}
