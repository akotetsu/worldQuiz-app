# 世界の国クイズ

スマートフォンで楽しく学べる世界の国に関するクイズアプリです。国の知識、国旗、首都などのジャンルから選んでチャレンジできます。
就職活動が終了し落ち着き次第Storeに公開します！

## 機能

- **ジャンル選択**: 3つのクイズジャンルから選択可能
  - 世界の国知識クイズ
  - 国旗クイズ
  - 世界の首都クイズ
- **クイズプレイ**: 各ジャンルで5問のクイズに挑戦
- **プログレスバー**: 現在の問題番号に応じて進捗がわかるバーを表示
- **ヒント機能**: 問題ごとに1回だけ使えるヒントボタンを搭載。誤答の選択肢を1つ自動的に削除します
- **サウンドフィードバック**: 正解・不正解時に効果音で反応
- **スコア表示**: クイズ終了後に成績を表示

## 技術スタック

- **Swift**: プログラミング言語
- **SwiftUI**: ユーザーインターフェイス構築
- **AVFoundation**: 音声再生機能
- **UIKit統合**: UIApplicationとの連携

## アプリ構成

- **StartView**: アプリ起動時の初期画面
- **GenreSelectionView**: クイズジャンルを選択する画面
- **QuizView**: 問題を表示し、回答やヒント使用を受け付ける画面
- **ScoreView**: クイズ終了後のスコア表示画面

## カスタムコンポーネント

- **StrokeBackground**: テキストに縁取りを追加するカスタムモディファイア
- **SoundPlayer**: 効果音を再生するためのクラス
- **QuizItem**: クイズデータ構造
- **View拡張**: 背景画像の設定など、View操作を簡素化

## 今後の拡張予定

- クイズ問題の追加
- 難易度選択機能
- 結果の保存とプレイヤー統計
- オンラインランキング機能

## 開発環境

- Xcode 15.x
- iOS 17.x 以上

## インストール方法

1. リポジトリをクローン
2. Xcodeでプロジェクトを開く
3. シミュレーターまたは実機で実行
