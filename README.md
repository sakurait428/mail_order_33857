# テーブル設計

## admins テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false,unique: true       |
| encrypted_password | string     | null: false                    |

### Association

- has_many :items

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| user_birth_date    | date       | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| phone_number       | string     | null: false                    |

### Association

- has_many :purchase_records
- has_many :cards

## cards テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_token         | string     | null: false                    |
| customer_token     | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## itemsテーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| name                   | string     | null: false                   |
| price                  | integer    | null: false                   |
| info_brand             | text       |                               |
| info_material          | text       |                               |
| info_size              | text       | null: false                   |
| category_id            | integer    | null: false                   |
| sales_status_id        | integer    | null: false                   |
| shipping_fee_status_id | integer    | null: false                   |
| prefecture_id          | integer    | null: false                   |
| scheduled_delivery_id  | integer    | null: false                   |
| purchase_record        | references | null: false, foreign_key: true|

### Association

- belongs_to :shop
- has_one :purchase_record
- has_many :item_categories

# item_categories

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item                 | references | null: false,  foreign_key: true|
| category             | references | null: false,  foreign_key: true|

### Association

- belongs_to :item
- belongs_to :category

# categories

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |

### Association

- has_many :item_categories


## purchase_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false,  foreign_key: true|
| item      | references | null: false,  foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

