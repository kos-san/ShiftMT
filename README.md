# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| phone_num          | string | null: false |

### Association

- has_many :stores
- has_many :members

## stores テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| store_name | string       | null: false                    |
| tel        | string       | null: false                    |
| opening    | int          | null: false                    |
| closing    | int          | null: false                    |
| user       | reference    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :members

## members テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| store  | reference | null: false, foreign_key: true |
| user   | reference | null: false, foreign,key: true |

### Association

- belongs_to :user
- belongs_to :store

## admins テーブル
| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| store  | reference | null: false, foreign_key: true |
| member | reference | null: false, foreign_key: true |

### Association

- belongs_to :member
- belongs_to :store