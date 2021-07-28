# :tomato: アプリケーション名 

### 自家製野菜通販サイト 「Vegeタベル」 

# :computer: 開発環境 

Ruby 2.6.5
Rails 6.0.4
MySQL Ver 14.14 

# :watermelon: アプリケーション概要 

自分で作った農作物を手軽に販売 
また購入できるアプリ 

### :boy: ユーザー 

* 商品の購入 

### :man:生産者 

* 商品の出品 

# :globe_with_meridians: URL 

https://vegetabel.herokuapp.com/ 

# :key: テスト用アカウント 

ユーザーテスト用アカウント
Email:    b@b
Password: bbb111
生産者テスト用アカウント
Email:    a@a
Password: aaa111 

# :mortar_board: 利用方法 

農作物を購入したい方は、ユーザー新規登録をして欲しい商品に必要事項を記入して購入 
農作物を販売したい方は、生産者登録をして売りたい商品の必要事項を記入して販売 

# :books: 目指した課題解決 

自分が農家だった頃、農作物のタネ、苗を買ってきて植えると予想以上の数が取れてしまう
食べ切る前には腐ってしまうし、周りは基本農家しかいないので手軽にお裾分けともいかない
スーパーではこれ100円とかで売ってるんだよなぁ...と思っていた自分へのアプリです。
他にも、スーパーで中々手に入らないものだったり、有機栽培・無農薬へのこだわりが強い方だったり、地産地消を意識している人の為になればという思いが詰まったアプリです。

# :newspaper: 洗い出した要件 

* 商品出品
* 商品詳細
* 商品編集
* 商品削除
* 商品購入
* 新着商品を表示
* メッセージ機能
* カテゴリー別表示
* 旬の野菜表示
* ワード検索
* マイページ追加(購入履歴)
* 生産者マイページ追加(売り上げ把握、販売履歴)
* カートに追加機能
* お気に入り農園登録機能 


# :black_nib: 実装した機能 

* 商品出品
* 商品詳細
* 商品編集
* 商品削除
* 商品購入
* 新着商品を表示 

# :memo: ER図 

![Vegetabel ER図](https://gyazo.com/54f2498cc83e13a1f17f22db1fc509bf) 

# :airplane: ローカルでの動作方法 

ローカルでは商品購入機能は使えません！ 

```java:ターミナル
git clone https://github.com/nina2728/vegetabel.git
```

```java:ターミナル
cd vegetabel
```

```java:ターミナル
bundle install
yarn install
```

```java:ターミナル
rails db:create
rails db:migrate
``` 

# :floppy_disk: テーブル設計

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