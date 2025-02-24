//
//  View+.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

extension View {
    @ViewBuilder
    func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeBackground(strokeSize: width, strokeColor: color))
    }
    
    @ViewBuilder
    func backgroundImage(_ image: Image = Image(.background)) -> some View {
        self
            .background(
                image
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .padding(-3)
                    
            )
    }
}

