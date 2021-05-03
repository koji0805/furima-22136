# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | null: false                   |
| email              | string     | null: false, unique: true     |
| encrypted_password | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| birthday           | date       | null: false                   |

### Association

* has_many :items
* has_one :creditcard, dependent: :destroy
* has_many :orders dependent: :destroy

# itemsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| description        | text       | null: false                   |
| category           | references | null: false, foreign_key:true |
| condition          | references | null: false, foreign_key:true |
| price              | integer    | null: false                   |
| users_id           | integer    | null: false                   |
| delivery_charge    | references | null: false, foreign_key:true |
| prefecture         | references | null: false, foreign_key:true |
| delivery_days      | references | null: false, foreign_key:true |



### Association

* belongs_to_active_hash :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :size
* belongs_to_active_hash :delivery_charge
* belongs_to_active_hash :prefecture
* belongs_to_active_hash :delivery_days
* has_many_attached :images
* belongs_to :user
* belongs_to_active_hash :delivery_way

## ordersテーブル

| Column         | Type      | Options                       |
| -------------- | --------- | ----------------------------- |
| buyer_user_id  | integer   | null: false                   |
| item_id        | integer   | null: false                   |

### Association

* has_many :items

# Purchaseテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| orders_id          | references | null: false, foreign_key:true |
| postal_code        | string     | null: false                   |
| prefecture         | integer    | null: false                   |
| address1           | string     | null: false                   |
| address2           | string     | null: false                   |
| telephone          | string     | null: false                   |
| building　         | string     | null: false                   |

### Association

* belongs_to :orders