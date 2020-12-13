# README

# アプリケーション名

大学生向け自己管理アプリ

# 概要

コロナにより大学生活が大きく変化いたしました。生徒側と大学側の生活、講義、課題等やり方が変わっております。
そこで自己管理アプリを作成いたしました。生徒側と大学側での登録を行ってもらい、教材、教材内容、教材講義へのQ＆A一つのアプリで管理することができるアプリケーションになります。

# 使用技術
HTML/CSS
Ruby
Rails
JavaScript

# 機能
## ログイン機能
生徒と大学側で登録してもらいます。
## 教材管理機能
生徒側の教材、単位、曜日等の登録を行います。

# 今後の追加機能
## スケジュール表
スケジュールの登録と確認が行えます。
## 教授ユーザー機能
大学側の教授の登録
## 教材内容
教授の教材内容を記載できる
## 教材講座管理機能
教材講座を行った日の内容を残せる
## 提出物BOX
提出物を保存が出来ます。
## Q&A
教材講座管理機能にQ＆Qを行える

# テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
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

## subjectsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| user_id       | references | foreign_key: true |
| class         | string     | null: false       |
| unit          | integer    | null: false       |
| period_genre  | integer    | null: false       |
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
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| user_id       | references | foreign_key: true |
| subject_id    | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :subject


## schedulesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
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

## bytesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
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
