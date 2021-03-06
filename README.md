# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | null: false                   |
| email              | string     | null: false, unique: true     |
| encrypted_password | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| birthday           | date       | null: false                   |

### Association

* has_many :items
* has_many :orders dependent: :destroy

# itemsテーブル

| Column                 | Type        | Options                       |
| ---------------------- | ----------- | ----------------------------- |
| name                   | string      | null: false                   |
| description            | text        | null: false                   |
| category_id  　　　　　　| integer     | null: false                   |
| condition_id           | integer     | null: false                   |
| delivery_charge_id     | integer     | null: false                   |
| prefecture_id          | integer     | null: false                   |
| delivery_day_id        | integer     | null: false                   |
| price                  | integer     | null: false                   |
| user                   | references  | null: false, foreign_key:true |


### Association

* belongs_to :user
* has_one :order

## ordersテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null: false, foreign_key:true |
| item    | references | null: false, foreign_key:true |

### Association

* belongs_to  :user
* belongs_to  :item
* has_one :purchase

# Purchaseテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| order              | references | null: false, foreign_key:true |
| postal_code        | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| address1           | string     | null: false                   |
| address2           | string     | null: false                   |
| telephone          | string     | null: false                   |
| building           | string     | 　　　　　　　                   |

### Association

* belongs_to :order