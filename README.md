## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| name               | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one :address

## purchases テーブル

| Column             | Type   | Options     |
| ------             | ------ | ----------- |
| buyer              | string | null: false |
| purchased_items    | string | null: false |
| user_id            | integer| foreign_key: true |
### Association

- belongs_to :users
- has_one :items
- has_one :address

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code         | string | null: false |
| prefectures         | string | null: false |
| city                | string | null: false |
| phone_number        | string | null: false |
| item_id             | integer| foreign_key: true |

### Association

- has_one :users
- has_one :purchase
- belongs_to :items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| items_name         | string | null: false |
| items_description  | string | null: false |
| items_status       | string | null: false |
| category           | string | null: false |
| shipping_charges   | string | null: false |
| shipping_area      | string | null: false |
| price              | string | null: false |
| days_to_ship       | string | null: false |
| seller             | string | null: false |
| user_id            | integer| foreign_key: true|
### Association

- belongs_to :users 
- has_one :purchases
- has_one :address
