//
//  ScoreView.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct ScoreView: View {
    let scoreText: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(scoreText)
                .font(.system(size: 40).bold())
                .foregroundStyle(.white)
                .stroke(color: .systemOrange, width: 3)
            Spacer()
            Button {
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                windowScene?.windows.first?.rootViewController?.dismiss(animated: true)
            } label: {
                Text("トップへ")
                    .font(.system(size: 50))
                    .foregroundStyle(.red)
                    .stroke(color: .black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundImage()
    }
}

#Preview {
    ScoreView(scoreText: "")
}
