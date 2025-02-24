//
//  QuizView.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct QuizItem {
    let question: String
    var choices: [String]
    let correctAnswer: String
}

struct QuizView: View {
    @State var isShowingScoreView = false
    @State var isShowingResultSymbol = false
    @State var isAnswerCorrect = false
    @State var correctCount = 0
    @State var currentQuestionIndex = 0
    
    let quizItems = [
        QuizItem(
            question: "次のうち、アジアに所属しない国はどこでしょう？",
            choices: ["中国","パキスタン","ミャンマー","モロッコ"],
            correctAnswer: "モロッコ"
        ),
        QuizItem(
            question: "次のうち、ヨーロッパに所属しない国はどこでしょう？",
            choices: ["ドイツ","イスラエル","リヒテンシュタイン","モンテネグロ"],
            correctAnswer: "イスラエル"
        ),
        QuizItem(
            question: "次のうち、海に囲まれていない内陸国はどこでしょう？",
            choices: ["モンゴル","スイス","ボツワナ","ポルトガル"],
            correctAnswer: "ポルトガル"
        ),
        QuizItem(
            question: "次のうち、アフリカに所属しない国はどこでしょう？",
            choices: ["エジプト", "タンザニア", "ネパール", "セネガル"],
            correctAnswer: "ネパール"
        ),
        QuizItem(
            question: "次のうち、ヨーロッパに所属しない国はどこでしょう？",
            choices: ["ポーランド", "スロバキア", "カザフスタン", "ベルギー"],
            correctAnswer: "カザフスタン"
        )
    ]
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("問題番号: \(currentQuestionIndex + 1)/\(quizItems.count)")
                    .font(.headline)
                    .padding(10)
                    .background(.systemOrange)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(quizItems[currentQuestionIndex].question)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.systemTeal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.brown, lineWidth: 5)
                    )
                    .frame(maxHeight: .infinity)
                ForEach(quizItems[currentQuestionIndex].choices, id: \.self) { choice in
                    Button {
                        if choice == quizItems[currentQuestionIndex].correctAnswer {
                            print("正解です")
                            correctCount += 1
                            isAnswerCorrect = true
                        } else {
                            print("不正解です")
                            isAnswerCorrect = false
                        }
                        
                        isShowingResultSymbol = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.isShowingResultSymbol = false
                            if currentQuestionIndex + 1 >= quizItems.count {
                                isShowingScoreView = true
                                return
                            }
                            currentQuestionIndex += 1
                        }
                    } label: {
                        Text(choice)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .font(.title.bold())
                            .background(.systemMint)
                            .foregroundStyle(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .fullScreenCover(isPresented: $isShowingScoreView) {
                        ScoreView(scoreText: "\(quizItems.count)問中\(correctCount)問正解！")
                    }
                }
            }
            .padding()
            
            if isShowingResultSymbol {
                Text(isAnswerCorrect ? "○" : "×")
                    .font(.system(size: 1000))
                    .minimumScaleFactor(0.1)
                    .foregroundStyle(isAnswerCorrect ? .green : .red)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black.opacity(0.5))
            }
        }
        .backgroundImage()
    }
}

#Preview {
    QuizView()
}
