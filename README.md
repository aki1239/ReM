# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計


## users テーブル
| Column     | Type    |  Options   |
| nickname   | string  |  null:false|
| email      | string  |  null:false|
| encrypted_password | string | null: false  |

### Association
has_many :movies

## movies テーブル

| Column     | Type      |  Options   |
| title      | string    | null: false| 
| genre_id   | integer   | null: false|
| text       | text      | null: false|
| phrase     | string    |null: false |
|user_id     |references | null: false,foreign_key:true    |
### Association
belongs_to :user

