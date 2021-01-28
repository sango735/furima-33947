# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| -----------------|------  | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | integer| null: false |


### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| state       | string     | null: false                    |
| burden      | string     | null: false                    |
| area        | text       | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- has_one     :purchase
- belongs_to  :user

## purchases テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| credit_number     | integer    | null: false                    |
| credit_date       | integer    | null: false                    |
| credit_security   | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |


### Association
- has_one     :delivery
- belongs_to  :user
- belongs_to  :item

## deliverys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_cote    | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to  :purchase