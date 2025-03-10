//
//  StartView.swift
//  worldQuiz
//
//  Created by 原里駆 on 2025/02/22.
//

import SwiftUI

struct StartView: View {
    //@State var isShowingQuizView = false
    @State var isShowingGenreSelectionView = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("世界の国\nクイズ")
                .font(.system(size: 70).bold())
                .foregroundStyle(.yellow)
                .stroke(color: .black, width: 5)
            Spacer()
            Button {
                isShowingGenreSelectionView = true
            } label: {
                Text("スタート")
                    .font(.system(size: 70))
                    .foregroundStyle(.red)
                    .stroke(color: .black)
            }
            .fullScreenCover(isPresented: $isShowingGenreSelectionView) {
                GenreSelectionView()
            }
        }
        .padding()
        .backgroundImage()
    }
}

#Preview {
    StartView()
}
