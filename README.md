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
- has_many :user_items, through: items


# テーブル設計

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string | null: false |
| phone_number       | string |             |

### Association

- belongs_to :user_item


# テーブル設計

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| product_name        | string | null: false |
| product_description | text   | null: false |
| category_id         | integer| null: false |
| sales_status_id     | integer| null: false |
| shipping_fee_status_id |integer| null: false |
| prefecture_id       | integer| null: false |
| scheduled_delivery_id | integer| null: false |
| price               | integer| null: false |

### Association

- belongs_to :user
- has_one :user-item


# テーブル設計

## user_items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_many :addresses

