# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items
- has_many :orders


# テーブル設計

## addresses テーブル

| Column             | Type    | Options                         |
| ------------------ | ------- | ------------------------------- |
| postal_code        | string  | null: false, foreign_key: true  |
| prefecture_id      | integer | null: false, foreign_key: true  |
| city               | string  | null: false, foreign_key: true  |
| address            | string  | null: false, foreign_key: true  |
| building_name      | string  | foreign_key: true               |
| phone_number       | string  | null: false, foreign_key: true  |

### Association

- belongs_to :order


# テーブル設計

## items テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| product_name           | string    | null: false                    |
| product_description    | text      | null: false                    |
| category_id            | integer   | null: false, foreign_key: true |
| sales_status_id        | integer   | null: false, foreign_key: true |
| shipping_fee_status_id | integer   | null: false, foreign_key: true |
| prefecture_id          | integer   | null: false, foreign_key: true |
| scheduled_delivery_id  | integer   | null: false, foreign_key: true |
| price                  | integer   | null: false                    |

### Association

- belongs_to :user
- has_one :order


# テーブル設計

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

