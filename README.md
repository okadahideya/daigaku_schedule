# README

# アプリケーション名

大学生向け自己管理アプリ

# 概要

コロナにより大学生活が大きく変化し、生徒側と大学側の生活、講義、課題等やり方が変わっております。
母校の大学に訪問し、現在の問題を確認いたしました。
生徒側は、大学にこれず自己管理ができず、単位を落としてしまう可能性が上がってしまう。
教授側は、提出の管理が増え、生徒からの質問もメールでくるが同じ質問が多く手間になっています。
そこで自己管理アプリを作成いたしました。生徒側と大学側での登録を行ってもらい、
教材、教材内容、教材講義から提出物・Q＆Aを一つのアプリで管理することができるアプリケーションになります。

# 使用技術
HTML/CSS
Ruby
Ruby on Rails
JavaScript
SQL
GitHub

# 機能
## ログイン機能
生徒と教授で登録してもらいます。
## 教材管理機能
生徒側の教材、単位、曜日等の登録を行います。
## スケジュール表
スケジュールの登録と確認が行えます。
## 生徒側の教材検索機能
教授が登録した教材を全て検索可能です。
検索した教材から講義内容を確認できます。
## 教授ユーザー機能
大学側の教授の登録
## 教材内容
教授の教材内容を記載できる。
## 教材講義管理機能
講義を行った日の内容を残せる
PowerPoint等の添付と講義内容を残せます。
日付、提出物、Q&Aを出来るようにしております。
## 提出物BOX
生徒の提出物をダウンロード式で確認できます。
提出した生徒は、自分の提出部しか表示されません。
教授は、提出した生徒全員のを確認できます。
## Q&A
教材講座管理機能にQ＆Aを行えます。
Qを生徒、Aを教授になります。

# テーブル設計

## usersテーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| name_k        | string | null: false |
| nickname      | string | null: false |
| university    | string | null: false |
| undergraduate | string | null: false |
| department    | string | null: false |

### Association

has_many :subjects
has_many :subject_details
has_many :schedules
has_many :submissions
has_many :questions

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

### Association

belongs_to :user
has_many   :subject_details

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

## professorsテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| name_p           | string | null: false |
| name_k_p         | string | null: false |
| university       | string | null: false |
| undergraduate    | string | null: false |
| department       | string | null: false |
| professor_detail | text   |             |
| qualification    | string |             |

### Association

has_one_attached :image
has_many :lectures
has_many :lecture_details
has_many :answers

## lecturesテーブル

| Column        | Type       | Options           |
| --------------| ---------- | ----------------- |
| professor_id  | references | foreign_key: true |
| lecture_title | string     | null: false       |
| contents      | text       | null: false       |

### Association

has_one_attached :lecture_image
belongs_to :professor
has_many   :lecture_details

## lecture_detailsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| professor_id       | references | foreign_key: true |
| lecture_id         | references | foreign_key: true |
| lecture_date       | date       | null: false       |
| lecture_title_list | string     | null: false       |
| lecture_text       | text       | null: false       |

### Association

has_one_attached :lecture_office
belongs_to :professor
belongs_to :lecture
has_many :submissions
has_many :questions

## submissionsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user_id            | references | foreign_key: true |
| lecture_detail_id  | references | foreign_key: true |

### Association

has_one_attached :user_office
belongs_to :user
belongs_to :lecture_detail

## questionsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user_id            | references | foreign_key: true |
| lecture_detail_id  | references | foreign_key: true |
| question_text      | text       | nill: false       |

### Association

belongs_to :user
belongs_to :lecture_detail
has_many   :answers

## answersテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| professor_id | references | foreign_key: true |
| question_id  | references | foreign_key: true |
| answer_text  | text       | nill: false       |

### Association

belongs_to :professor
belongs_to :question
