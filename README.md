## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true, null:false|
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
| user_id            | integer| foreign_key: true |
| item_id            | integer| foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code         | string | null: false |
| shipping_area_id    | integer | null: false |
| city                | string | null: false |
| phone_number        | string | null: false |
| house_number        | string | null: false |
| building_number     | string |  |
| purchase_id         | integer| foreign_key: true|
### Association

- belongs_to :purchase

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name         | string | null: false |
| description  | text   | null: false |
| items_status_id    | integer | null: false |
| category_id        | integer| null: false |
| shipping_charges_id| integer | null: false |
| shipping_area_id   | integer | null: false |
| price              | integer | null: false |
| days_to_ship_id    | integer | null: false |
| user_id            | integer| foreign_key: true|
### Association

- belongs_to :user
- has_one :purchase
