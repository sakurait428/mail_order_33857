サイトについての詳細は、こちらへ記載してあります  
http://s428.sakura.ne.jp/pf/brilhar_info.html

# テーブル設計

## admins

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false,unique: true       |
| encrypted_password | string     | null: false                    |

### Association

## inquiries

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| email              | string     | null: false                    |
| message            | text       | null: false                    |

### Association

## users

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
| block              | string     | null: false                    |
| phone_number       | string     | null: false                    |

### Association

- has_one :card, dependent: :destroy

## items

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| name                   | string     | null: false                   |
| info_product           | text       | null: false                   |
| price                  | integer    | null: false                   |
| info_brand             | text       |                               |
| info_material          | text       |                               |
| info_size              | text       | null: false                   |
| category_id            | integer    | null: false                   |
| sales_status_id        | integer    | null: false                   |
| shipping_fee_status_id | integer    | null: false                   |
| prefecture_id          | integer    | null: false                   |
| scheduled_delivery_id  | integer    | null: false                   |
| category_id            | integer    | null: false                   |
| gender                 | integer    | null: false                   |
| stock_quantity         | integer    |                               |
| purchase_record        | references | null: false, foreign_key: true|

### Association

- has_many_attached :images
- belongs_to :category
- has_many :cart_items, dependent: :destroy

# categories

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| ancestry             | string     |                                |

### Association

- has_many :items

## cart_items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| quantity           | integer    | default: 0                     |
| item               | references |                                |
| cart               | references |                                |
| user               | references |                                |
| order_id           | references |                                |

### Association

 - belongs_to :item
 - belongs_to :cart

## carts

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |

### Association

 - has_many :cart_items

## orders

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| postal_code        | string     | null: false                    |
| address            | text       | null: false                    |
| email              | string     | null: false                    |
| phone_number       | string     | null: false                    |
| user               | references | null: false                    |

### Association

 - has_many :cart_items, dependent: :destroy
 - has_many :items

## cards

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_token         | string     | null: false                    |
| customer_token     | string     | null: false                    |
| user               | references | foreign_key: true              |

### Association

- belongs_to :user

