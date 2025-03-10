//
//  QuizView.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct QuizView: View {
    @State var isShowingScoreView = false
    @State var isShowingResultSymbol = false
    @State var isAnswerCorrect = false
    @State var correctCount = 0
    @State var currentQuestionIndex = 0
    
    @Binding var quizItems: [QuizItem]
    
    // ヒント機能用の状態変数
    @State private var availableChoices: [String] = []
    @State private var hasUsedHint = false
    
    let soundPlayer = SoundPlayer() // 音を鳴らすためのインスタンス作成
    
    var body: some View {
        ZStack {
            VStack {
                // 問題番号とプログレスバー
                Text("問題番号: \(currentQuestionIndex + 1)/\(quizItems.count)")
                    .font(.headline)
                    .padding(10)
                    .background(.systemOrange)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                ProgressView(value: Double(currentQuestionIndex + 1), total: Double(quizItems.count))
                    .padding(.horizontal, 20)
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                    .tint(.systemIndigo)
                
                // 問題内容
                VStack {
                    Text(quizItems[currentQuestionIndex].question)
                        .font(.title)
                    quizItems[currentQuestionIndex].questionImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.systemTeal.clipShape(RoundedRectangle(cornerRadius: 10)))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.systemIndigo, lineWidth: 5)
                )
                .frame(maxHeight: .infinity)
                
                // ヒントボタン（1問につき1回のみ使用可能）
                Button(action: {
                    useHint()
                }) {
                    Text("ヒントを使う")
                        .font(.headline)
                        .padding()
                        .background(hasUsedHint ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(hasUsedHint)
                .padding(.bottom, 10)
                
                // 選択肢を availableChoices から表示
                ForEach(availableChoices, id: \.self) { choice in
                    Button {
                        answerTapped(choice: choice)
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
            // 初回表示時、availableChoices を初期化
            .onAppear {
                availableChoices = quizItems[currentQuestionIndex].choices
            }
            // 問題が切り替わった際に、availableChoices とヒント使用フラグをリセット
            .onChange(of: currentQuestionIndex) { newIndex in
                availableChoices = quizItems[newIndex].choices
                hasUsedHint = false
            }
            
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
    
    func answerTapped(choice: String) {
        if choice == quizItems[currentQuestionIndex].correctAnswer {
            print("正解です")
            soundPlayer.correctPlay()
            correctCount += 1
            isAnswerCorrect = true
        } else {
            print("不正解です")
            soundPlayer.wrongPlay()
            isAnswerCorrect = false
        }
        
        isShowingResultSymbol = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isShowingResultSymbol = false
            if currentQuestionIndex + 1 >= quizItems.count {
                isShowingScoreView = true
                return
            }
            currentQuestionIndex += 1
        }
    }
    
    func useHint() {
        // 既にヒントが使われている場合は何もしない
        guard !hasUsedHint else { return }
        
        let correctAnswer = quizItems[currentQuestionIndex].correctAnswer
        // 現在の選択肢から不正解の選択肢のみを抽出
        let wrongChoices = availableChoices.filter { $0 != correctAnswer }
        // 不正解の選択肢が存在する場合、ランダムに1つを除外
        if let choiceToRemove = wrongChoices.randomElement() {
            availableChoices.removeAll(where: { $0 == choiceToRemove })
            hasUsedHint = true
        }
    }
}

#Preview {
    QuizView(quizItems: .constant(QuizData.nationalFragQuestions))
}
