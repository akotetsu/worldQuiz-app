//
//  QuizItem.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct QuizItem {
    let question: String
    var questionImage: Image? = nil
    var choices: [String]
    let correctAnswer: String
}
