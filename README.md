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