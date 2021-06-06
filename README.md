## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name               | string | null: false |
| birthday           | date   | null: false |
| first_name_furigana         | string | null: false |
| last_name_furigana               | string | null: false |
### Association

- has_many :items
- has_many :purchases

## purchases テーブル

| Column             | Type   | Options     |
| ------             | ------ | ----------- |
| buyer              | string | null: false |
| purchased_items    | string | null: false |
| user_id            | integer| foreign_key: true |
### Association

- belong_to :user
- has_one :items
- has_one :address

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code         | string | null: false |
| prefectures         | string | null: false |
| cities              | string | null: false |
| phone_number        | string | null: false |
| item_id             | integer| foreign_key: true |
| house_number        | string | null: false |
| building_number     | string | null: false |
### Association

- has_one :users
- has_one :purchase
- belongs_to :item

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| items_name         | string | null: false |
| items_description  | text   | null: false |
| items_status       | string | null: false |
| category_id        | integer| null: false |
| shipping_charges   | string | null: false |
| shipping_area      | string | null: false |
| price              | string | null: false |
| days_to_ship       | string | null: false |
| seller             | string | null: false |
| user_id            | integer| foreign_key: true|
### Association

- belongs_to :user
- has_one :purchases
- has_one :address
