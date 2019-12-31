# HaskellでStateパターンやってみた。
___全15回(2019.04-2020.01)___

## 第1回 Stateパターンの実装をとおしてポリモーフィズムを体感する。
### ◇概要
Stateパターンの実装をとおして、Haskellにおけるポリモーフィズムがどんな感じか、体感していきたいと思います！！  
VSCodeの便利な拡張機能を活用して、うまく解説できればと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/KI6EIISTPas/0.jpg)](https://youtu.be/KI6EIISTPas)


## 第2回 値アドホック多相？ テキな。
### ◇概要
Haskellのパターンマッチは強力なので、関数の引数(値)によるアドホック多相テキな動きを見ていきたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/1ATSDOjZwI0/0.jpg)](https://youtu.be/1ATSDOjZwI0)


## 第3回 カプセル化をモジュール分割でやってみる。→ NG。
### ◇概要
Haskellでは、オブジェクト指向言語におけるクラスによるカプセル化はないので、
モジュール単位でカプセルしてみる。
モジュール構成は、PlantUMLでパッケージ図として描いてみよう！
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/7szaxfwnNQs/0.jpg)](https://youtu.be/7szaxfwnNQs)


## 第4回 型によるアドホック多相。
### ◇概要
今回は、Wikipediaに記載のとおり、型を対象としたアドホック多相を実装してみたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/L7zpnGWC7z4/0.jpg)](https://youtu.be/L7zpnGWC7z4)



## 第5回 カプセル化をモジュール分割でやってみる。再。
### ◇概要
前回実装したアドホック多相のコードを、クラス図にあわせて、状態ごとにモジュール分割してみます。
値によるアドホック多相テキなコードでは、コンパイルエラーとなりモジュール分割できませんでしたが、今回はうまくいくでしょうか？
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/IMvmeqPw3d8/0.jpg)](https://youtu.be/IMvmeqPw3d8)



## 第6回 Stateモナド登場！！
### ◇概要
今回は、ステートパターンのコンテキスト側の実装を考えていきます。  
満を持して、ステートモナドの登場です。
ステートモナドで状態情報を保持するようにしてみたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/yu-FMc0hoNg/0.jpg)](https://youtu.be/yu-FMc0hoNg)


## 第7回 ファントムタイプによる部分型付け。
### ◇概要
今回は、ステートモナドで保持する状態情報について、ファントムタイプを使って部分型付けをやってみたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/LptRj5rbKqc/0.jpg)](https://youtu.be/LptRj5rbKqc)


## 第8回 データファミリーで部分型付け
### ◇概要
今回は、前回、ファントムタイプで部分型付けを実現したところを、
意味合いてきにも、タイプファミリー拡張で、状態の部分型付けをやってみたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/3eDoWe85TDI/0.jpg)](https://youtu.be/3eDoWe85TDI)


## 第9回 GADTsで部分型付け
### ◇概要
今回は、前回、タイプファミリーで部分型付けを実現したところを、
GADTｓで状態の部分型付けを、やってみたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/CFyUvbvsECI/0.jpg)](https://youtu.be/CFyUvbvsECI)


## 第10回 データファミリーで部分型付けx2
### ◇概要
今回は、ステートパターンのコンテキスト側からの、状態ごとの処理の呼び出しを、リクエスト化してみます。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/s3t_9D9Yrmw/0.jpg)](https://youtu.be/s3t_9D9Yrmw)


## 第11回 GADTsで部分型付けx2
### ◇概要
今回は、ステートパターンのコンテキスト側からの、状態ごとの処理の呼び出しを、閉じたデータ型である、ガッツで試してみます。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/s5YTNQSH_jM/0.jpg)](https://youtu.be/s5YTNQSH_jM)


## 第12回 型変数が複数の型クラス
### ◇概要
今回は、前回、値アドホック多相でリクエストの処理を分岐した箇所について、
その後の実装を、状態とリクエストの、階層的なモジュールに分解してみます。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/KKs4063YsM0/0.jpg)](https://youtu.be/KKs4063YsM0)


## 第13回 最終回 状態遷移
### ◇概要
だいぶ時間がかかりましたが、本連載は、今回で一通り終わりです。  
この連載で作っていたサンプルをgithubにあげています。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/GEA1gnX8fUA/0.jpg)](https://youtu.be/GEA1gnX8fUA)


## 第14回 最終回のあとのTH
### ◇概要
前回までで、状態遷移について一通り実装ができたのですが、一部、重複するコードがあるので、テンプレートハスケルで、ボイラープレート化してみたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/0kLFVeK6akI/0.jpg)](https://youtu.be/0kLFVeK6akI)

## 第15回 最終回のあとのTH2
### ◇概要
前回確認した、テンプレートハスケルでボイラープレート化する箇所の
自動生成コートを見ていきたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/IJJyRx0j8P8/0.jpg)](https://youtu.be/IJJyRx0j8P8)


