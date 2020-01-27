# DB設計
## albumsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|color|string|null: false|
|user_id|integer||
### アソシエーション
- belongs_to :user
- has_many :posts

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||
|text|text||
|image|string|null: false|
|image_date|date||
|album_id|integer||
|user_id|integer||
### アソシエーション
- belongs_to :user
- belongs_to :album

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
### アソシエーション
- has_many :albums
- has_many :posts