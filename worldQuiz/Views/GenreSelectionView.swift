//
//  GenreSelectionView.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct GenreSelectionView: View {
    @State var isShowingQuizView = false
    @State var selectionQuizData: [QuizItem] = []
    
    var body: some View {
        VStack {
            Button {
                selectionQuizData = QuizData.knowledgeQuestions
                isShowingQuizView = true
            } label: {
                Text("世界の国知識クイズ")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title.bold())
                    .background(.systemMint)
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Button {
                selectionQuizData = QuizData.nationalFragQuestions
                isShowingQuizView = true
            } label: {
                Text("国旗クイズ")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title.bold())
                    .background(.systemMint)
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Button {
                selectionQuizData = QuizData.capitalQuestions
                isShowingQuizView = true
            } label: {
                Text("世界の首都クイズ")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title.bold())
                    .background(.systemMint)
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .frame(maxHeight: .infinity) //独自に追加
        .backgroundImage()
        .fullScreenCover(isPresented: $isShowingQuizView) {
            QuizView(quizItems: $selectionQuizData)
        }
    }
}

#Preview {
    GenreSelectionView()
}
