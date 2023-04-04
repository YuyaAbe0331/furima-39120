## usersテーブル

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|first_name        |string |null: false              |
|last_name         |string |null: false              |
|kana_first_name   |string |null: false              |
|kana_last_name    |string |null: false              |
|date_of_birth     |date   |null: false              |


### Association
has_many :items
has_many :purchases

## itemsテーブル

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|name         |string    |null: false                   |
|content      |text      |null: false                   |
|category_id  |integer   |null: false                   |
|status_id    |integer   |null: false                   |
|delivery_id  |integer   |null: false                   |
|prefecture_id|integer   |null: false                   |
|duration_id  |integer   |null: false                   |
|price        |integer   |null: false                   |
|user         |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase

## purchasesテーブル

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|post_code     |string    |null: false                   |
|prefecture_id |integer   |null: false                   |
|municipality  |string    |null: false                   |
|address       |string    |null: false                   |
|building      |string    |                              |
|telephone     |string    |null: false                   |
|purchase      |references|null: false, foreign_key: true|

### Association
belongs_to :purchase