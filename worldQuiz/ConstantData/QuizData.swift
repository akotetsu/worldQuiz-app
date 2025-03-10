//
//  QuizData.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct QuizData {
    static let knowledgeQuestions: [QuizItem] = [
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
    
    static let nationalFragQuestions: [QuizItem] = [
        QuizItem(
            question: "どこの国の国旗でしょう？",
            questionImage: Image("ntf_608"),
            choices: ["ニュージーランド", "オーストラリア", "アメリカ", "イギリス"],
            correctAnswer: "ニュージーランド"
        ),
        QuizItem(
            question: "どこの国の国旗でしょう？",
            questionImage: Image("ntf_210"),
            choices: ["ガーナ", "カメルーン", "ギニア", "セネガル"],
            correctAnswer: "カメルーン"
        ),
        QuizItem(
            question: "どこの国の国旗でしょう？",
            questionImage: Image("ntf_142"),
            choices: ["ネパール", "ミャンマー", "モンゴル", "タイ"],
            correctAnswer: "ミャンマー"
        ),
        QuizItem(
            question: "どこの国の国旗でしょう？",
            questionImage: Image("ntf_318"),
            choices: ["スロベニア", "セルビア", "クロアチア", "スロバキア"],
            correctAnswer: "スロバキア"
        ),
        QuizItem(
            question: "どこの国の国旗でしょう？",
            questionImage: Image("ntf_325"),
            choices: ["ハンガリー", "ブルガリア", "リトアニア", "モンテネグロ"],
            correctAnswer: "ハンガリー"
        )
        
    ]
    
    static let capitalQuestions: [QuizItem] = [
        QuizItem(
               question: "中国の首都は次のうちどれでしょう？",
               choices: ["上海", "北京", "広州", "深セン"],
               correctAnswer: "北京"
           ),
           QuizItem(
               question: "インドの首都は次のうちどれでしょう？",
               choices: ["ムンバイ", "バンガロール", "ニューデリー", "コルカタ"],
               correctAnswer: "ニューデリー"
           ),
           QuizItem(
               question: "ブラジルの首都は次のうちどれでしょう？",
               choices: ["リオデジャネイロ", "サンパウロ", "ブラジリア", "サルバドル"],
               correctAnswer: "ブラジリア"
           ),
           QuizItem(
               question: "オーストラリアの首都は次のうちどれでしょう？",
               choices: ["シドニー", "メルボルン", "キャンベラ", "ブリスベン"],
               correctAnswer: "キャンベラ"
           ),
           QuizItem(
               question: "トルコの首都は次のうちどれでしょう？",
               choices: ["イスタンブール", "アンカラ", "イズミル", "ブルサ"],
               correctAnswer: "アンカラ"
           )
    ]
}
