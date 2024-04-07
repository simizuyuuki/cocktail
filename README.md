# アプリケーション名
cocktail_tweet

# アプリケーション概要 
サインアップしログインしている投稿者のユーザーがカクテル画像を投稿し投稿した画像に対してログインしている第三者がコメントできるアプリ

# URL
https://cocktail-08lv.onrender.com

# テスト用アカウント
・Basic認証パスワード : 2222

・Basic認証ID : admin

・メールアドレス : test@gmail.com

・パスワード : test1111 

・メールアドレス : test@ezweb.com

・パスワード : test1111

# 利用方法

# カクテル画像を投稿する
1. トップページ（一覧ページ）より新規登録画面に遷移するので記載事項を入力し「Sign up」のボタンをクリックし登録を完了させる。
2. 新規登録を済ませログインしたユーザーは、トップページの「投稿する」ボタンをクリックし新規投稿画面に遷移するので、必要事項を記入し「send」ボタンを押すと問題なく投稿できればトップページに遷移する。

# 良いカクテル画像があればコメントできる
1. トップページ（一覧ページ）よりログインしているユーザーは気に入ったカクテル画像があれば、画像の右上にある（隠れている）詳細ボタンをクリックすれば詳細画像ページに遷移する。
2. 詳細ページにてカクテル画像の見た目の感想をコメントできる。

# アプリケーション作成した背景
自身がカクテルを作ったり、お酒を販売したりする職業に従事していた為、お洒落なカクテルの投稿サイトを作成すれば、カクテルづくりに興味のある方が当アプリを利用すればカクテルづくりの参考になり、カクテルづくりが趣味というカテゴリーが作れると思った為。

# 実装した機能
ユーザー登録機能  
(https://gyazo.com/be2bc60d3cdf1eb70f6fbc34596cc32f)

プレビュー機能を実装した投稿投稿機能 
(https://gyazo.com/180ea833a16320fb687be3f3325e5f64)

コメント投稿機能  
(https://gyazo.com/352e7d11e1e9dc8a1bcd23a70ed24a12)

マイページ機能
(https://gyazo.com/224b01e6d0edbba6fa0572bd731defbb)

# 実装予定の機能
1. いいね機能の実装

# データベース設計

## users Tabel

|  Column  |  Type  |   Options   |
|----------|--------|-------------|
| nickname | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :tweet
- has_many :comment

## tweets Tabel

|  Column  |  Type  |   Options   |
|----------|--------|-------------|
| name     | string | null: false |
| text     | text   | null: false |
| user_id  | integer | null: false |

### Association

- belongs_to :user
- has_many :comments

## comments Tabel

|  Column  |  Type  |   Options   |
|----------|--------|-------------|
| user_id     | string | null: false |
| tweet_id    | string | null: false |
| text  | test |  |

### Association

- belongs_to :user
- belongs_to :tweet

# 画面遷移図

Page1  <--> Page2 <-->Page3