# README

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| lastname           | string | null: false               |
| firstname          | string | null: false               |
| lastname_furigana  | string | null: false               |
| firstname_furigana | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| price         | integer    | null: false                    |
| category      | string     |                                |
| status        | string     | null: false                    |
| delivery_cost | string     | null: false                    |
| sender        | string     | null: false                    |
| shipping_days | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column | Type | Options |
|--------|------|---------|
|        |      |         |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column                | Type   | Options     |
|-----------------------|--------|-------------|
| post_code             | string | null: false |
| shipping_prefecture   | string | null: false |
| shipping_municipality | string | null: false |
| shipping_address      | string | null: false |
| shipping_building     | string |             |
| buyer_phone_number    | string | null: false |

### Association

- belongs_to :order