## プロジェクト名

Nflix

## 概要

* 映画の検索、再生
* ダウンロードした映画の管理、削除

## ビルド

### Rubyのインストール

```
$ brew install rbenv
$ rbenv install 2.7.1
```

### CocoaPodのインストール

```
$ bundle install
```

### CoccoaPod管理のパッケージインストール

```
$ bundle exec pod install
```

### ビルド

XcodeからNetflix Clone.xcworkspaceを開き、ビルド


Xcodeシミュレーターで動作させる場合、Dark Modeを設定する

設定　-> デベロッパ -> Appearance -> Dark Appearance

## 使用技術

* Xcode14.1
* UIKit
* Storyboard
* SwiftGen
* Cocoapod
* SwiftLint

## アーキテクチャ

MVVM
