# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | null: false                   |
| email              | string     | null: false                   |
| encrypted_password | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| birthday_yyyy_id   | integer    | null: false                   |
| birthday_mm_id     | integer    | null: false                   |
| birthday_dd_id     | integer    | null: false                   |

### Association

* has_many :items
* has_one :creditcard, dependent: :destroy
* has_many :orders dependent: :destroy

# itemsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| image              | references | null: false, foreign_key:true |
| name               | string     | null: false                   |
| description        | text       |                               |
| category           | references | null: false, foreign_key:true |
| condition          | references | null: false, foreign_key:true |
| price              | integer    | null: false                   |

### Association

* belongs_to_active_hash :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :size
* belongs_to_active_hash :delivery_charge
* belongs_to_active_hash :prefecture
* belongs_to_active_hash :delivery_days
* has_many_attached :images
* belongs_to :user

## ordersテーブル

| Column         | Type      | Options                       |
| -------------- | --------- | ----------------------------- |
| buyer_user_id  | integer   | null: false                   |
| item_id        | integer   | null: false                   |
| delivery_charge| reference | null: false, foreign_key:true |
| prefecture     | reference | null: false, foreign_key:true |
| ddelivery_ays  | reference | null: false, foreign_key:true |

### Association

* has_many :items

# Purchaseテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key:true |
| card_id            | string     | null: false                   |
| expiration_mm_id   | text       |                               |
| expiration_yyyy_id | references | null: false, foreign_key:true |
| postal_code        | references | null: false, foreign_key:true |
| prefecture         | integer    | null: false                   |
| address1           | integer    | null: false                   |
| address2           | integer    | null: false                   |
| telephone          | integer    | null: false                   |


### Association

* belongs_to :user