# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- |------  | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |
| birthday             | date   | null: false |


### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- has_one     :purchase
- belongs_to  :user

## purchases テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |


### Association
- has_one     :delivery
- belongs_to  :user
- belongs_to  :item

## deliverys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_cote    | string     | null: false                    |
| area_id        | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to  :purchase