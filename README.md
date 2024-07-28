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
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :items
- has_many :orders, through: :items
- has_one  :addresses


# テーブル設計

## orders テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string | null: false |
| phone_number       | string | null: false |

### Association

- belongs_to :items
- belongs_to :users
- has_many   :addresses


# テーブル設計

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| product_name        | string | null: false |
| product_description | text   | null: false |
| category            | string | null: false |
| product_condition   | string | null: false |
| shipping_cost       | string | null: false |
| shipping_region     | string | null: false |
| shipping_days       | string | null: false |
| price               | float  | null: false |

### Association

- has_one :orders
- belongs_to :users


# テーブル設計

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchaser          | string | null: false |

### Association

- belongs_to :users
- belongs_to :orders
