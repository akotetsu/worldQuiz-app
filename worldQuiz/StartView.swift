//
//  StartView.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct StartView: View {
    @State var isShowingQuizView = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("世界の国\nクイズ")
                .font(.system(size: 70).bold())
                .foregroundStyle(.yellow)
                .stroke(color: .black, width: 5)
            Spacer()
            Button {
                isShowingQuizView = true
            } label: {
                Text("スタート")
                    .font(.system(size: 50))
                    .foregroundStyle(.red)
                    .stroke(color: .black)
            }
            .fullScreenCover(isPresented: $isShowingQuizView) {
                QuizView()
            }
        }
        .padding()
        .backgroundImage()
    }
}

#Preview {
    StartView()
}
