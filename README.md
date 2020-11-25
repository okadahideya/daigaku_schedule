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

＃テーブル設計


##usersテーブル
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| name_k   | string | null: false |
| nickname | string | null: false |
### Association
has_many :subjects
has_many :timetable
has_many :bytes
has_many :schedules

##subjectsテーブル
| user_id       | references | foreign_key: true |
| class         | string     | null: false       |
| unit          | integer    | null: false       |
| period_genre   | integer    | null: false       |
| select_genre  | integer    | null: false       |
| week_genre    | integer    | null: false       |
| time_genre    | integer    | null: false       |
| grade_genre   | integer    | null: false       |
| result_genre  | integer    | null: false       |
| unit_sum      | integer    | null: false       |
| university    | string     | null: false       |
| undergraduate | string     | null: false       |
| department    | string     | null: false       |
### Association
belongs_to :user
has_many   :timetable


##timetablesテーブル
| user_id       | references | foreign_key: true |
| subject_id    | references | foreign_key: true |
### Association
belongs_to :user
belongs_to :subject


##schedulesテーブル
| user_id       | references | foreign_key: true |
| subject_id    | references | foreign_key: true |
| part_time_id  | references | foreign_key: true |
| title         | string     | null: false       |
| text          | text       |                   |
| time          | time       |                   |
| are           | string     |                   |
### Association
belongs_to :user
has_many   :bytes

##bytesテーブル
| user_id       | references | foreign_key: true |
| schedule_id   | references | foreign_key: true |
| day           | date       | null: false       |
| time          | time       | null: false       |
| title         | string     | null: false       |
| time_sum      | integer    |                   |
| hourly_wage   | integer    |                   |
### Association
belongs_to :user
belongs_to :schedule
