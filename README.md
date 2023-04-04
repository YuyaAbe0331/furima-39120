## usersテーブル

|Column         |Type   |Options                  |
|---------------|-------|-------------------------|
|nickname       |string |null: false              |
|email          |string |null: false, unique: true|
|password       |string |null: false              |
|first_name     |string |null: false              |
|last_name      |string |null: false              |
|kana_first_name|string |null: false              |
|kana_last_name |string |null: false              |
|year_id        |integer|null: false              |
|month_id       |integer|null: false              |
|day_id         |integer|null: false              |

### Association
has_many :items
has_many :purchases

## itemsテーブル

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|name       |string    |null: false                   |
|content    |string    |null: false                   |
|category_id|integer   |null: false                   |
|status_id  |integer   |null: false                   |
|delivery_id|integer   |null: false                   |
|sender_id  |integer   |null: false                   |
|days_id    |integer   |null: false                   |
|price      |integer   |null: false                   |
|user_id    |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase

## purchasesテーブル

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user_i  |references|null: false, foreign_key: true|
|items_id|references|null: false, foreign_key: true|


### Association
belongs_to :user
belongs_to :item
belongs_to :address



## addressesテーブル

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|post_code     |string    |null: false                   |
|prefectures_id|integer   |null: false                   |
|municipalities|string    |null: false                   |
|address       |string    |null: false                   |
|building      |string    |                              |
|telephone     |integer   |null: false                   |


### Association
has_one :purchase