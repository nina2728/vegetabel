# アプリケーション名

「Vegeタベル」

# アプリケーション概要

自分で作った農作物を手軽に販売
また購入できるアプリ

# URL

# テスト用アカウント

# 利用方法

農作物を購入したい方は、ユーザー新規登録をして欲しい商品に必要事項を記入して購入
農作物を販売したい方は、生産者登録をして売りたい商品の必要事項を記入して販売

# 目指した課題解決

自分が農家だった頃、農作物のタネ、苗を買ってきて植えると予想以上の数が取れてしまう
食べ切る前には腐ってしまうし、周りは基本農家しかいないので手軽にお裾分けともいかない
スーパーではこれ100円とかで売ってるんだよなぁ...と思っていた自分へのアプリです。
他にも、スーパーで中々手に入らないものだったり、有機栽培・無農薬へのこだわりが強い方だったり、地産地消を意識している人の為になればという思いが詰まったアプリです。

# 洗い出した要件

# 実装した機能

# ER図

vegetabel_er.dio

# ローカルでの動作方法

# テーブル設計

## usersテーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| nickname             | string  | null: false               |
| full_name_kanji      | string  | null: false               |
| full_name_kana       | string  | null: false               |
| birthday             | date    | null: false               |
| postal_code          | string  | null: false               |
| prefecture_id        | integer | null: false               |
| municipality         | string  | null: false               |
| address              | string  | null: false               |
| building_name        | string  |                           |
| phone_number         | string  | null: false               |


### Association

- has_many :purchase_items

## farmersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| name               | string     | null: false                    |
| representative     | string     | null: false                    |
| representative_kana| string     | null: false                    |
| birthday           | date       | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| career             | text       | null: false                    |
| comment            | text       | null: false                    |
| point              | text       | null: false                    |

### Association

- has_many :items

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| contents      | string     | null: false                    |
| category_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| shipping_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| farmer        | references | null: false, foreign_key: true |

### Association

- belongs_to :farmer
- has_one    :purchase_item

## purchase_itemsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :purchase

## purchasesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| purchase_item  | references | null: false, foreign_key: true |

## Association

- belongs_to :purchase_item