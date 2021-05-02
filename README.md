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
| phone_num | string | null:      | false                         |
| authentication_num | integer    | null: false                   |
| content            | text	      |                               |
| address            | references | null: false, foreign_key: true|
| telephone          | string     |	                              |

### Association

* has_one :profile, dependent: :destroy
* has_one :creditcard, dependent: :destroy
* has_many :products, dependent: :destroy
* has_many :buyer_trades, dependent: :destroy, class_name: "Trade", * foreign_key: "buyer_id"
* has_many :seller_trades, dependent: :destroy, class_name: "Trade", * foreign_key: "seller_id"

## Addressテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| zip_code1      | string	null| false       |
| prefecture_id  | integer    | null: false |
| city           | string     | null: false |
| address1       | string                   |
| address2       | string                   |

### Association

* belongs_to :user

# Productsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key:true |
| name               | string     | null: false                   |
| description        | text       |                               |
| category           | references | null: false, foreign_key:true |
| condition          | references | null: false, foreign_key:true |
| size               | references | null: false, foreign_key:true |
| brand              | string     |                               |
| delivery_charge    | references | null: false, foreign_key:true |
| delivery_way       | references | null: false, foreign_key:true |
| prefecture         | references | null: false, foreign_key:true |
| price              | integer    | null: false                   |
| status             | references | null: false, foreign_key:true |

### Association

* belongs_to_active_hash :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :size
* belongs_to_active_hash :delivery_charge
* belongs_to_active_hash :prefecture
* belongs_to_active_hash :delivery_days
* belongs_to_active_hash :delivery_way
* belongs_to_active_hash :status
* has_many_attached :images
* belongs_to :user
* add_index :products, :name

## Cardテーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| user        | references | null: false, foreign_key:true |
| customer_id | string     | null: false                   |
| card_id     | string     | null: false                   |

### Association

* belongs_to :user

## Categoryテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name    | string  | null: false |
| sub     | integer |             |
| sub_sub | integer |             |
| size    | integer |             |
| brand   | integer |             |

### Association

* has_many :products

## Conditionテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| value  | string | null: false |

### Association

* has_many :products

## Sizeテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| value   | string  | null: false |
| group   | integer |             |

### Association

* has_many :products

## DeliveryChargeテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| value  | string | null: false |

### Association

* has_many :products

## DeliveryDaysテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| value  | string | null: false |

### Association

* has_many :products

## DeliveryWaysテーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| value  | string  | null: false |
| charge | integer |             |

### Association

* has_many :products

## Prefectureテーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | string  | null: false |

### Association

* has_many :products

## Statusテーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | string  | null: false |

### Association

* has_many :products