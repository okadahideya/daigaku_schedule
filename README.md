# README

# アプリケーション名

#### ・大学生向け自己管理アプリ  


# 概要

　コロナにより大学生活が大きく変化し、生徒側と教授側の生活、講義、課題等やり方が変わっております。 生徒側は、大学にこれず自己管理ができない、単位を落としてしまう可能性が上がってしまいます。 教授側は、提出物の管理や生徒からの質問もメールでくるので同じ質問が多く手間になっています。 そこで今回のアプリを作成いたしました。講義管理、講義内容、講義から提出物・Q＆Aを一つのアプリで管理することができるアプリケーションになります。

# URL

環境は、AWSになります。  
ゲストから閲覧可能です。  
  
http://18.181.102.182/  
![7f0df0782a9ff00e430b5f8d9a977bdd](https://user-images.githubusercontent.com/73088476/106346509-11360b80-62fb-11eb-8354-438c80fd52dc.jpg)

# 制作背景

困っている方の解決をしていくために、この業界を目指しました。  
今回は、生徒と教授に役立つためのアプリケーションの開発を行いたく開発いたしました。


# 工夫ポイント
### ・生徒の講義管理登録を一括で行えるようにしました
学年と時期は親テーブル、講義、単位、科目、曜日、時間、結果を子テーブルになります。 
子テーブルは、追加・削除で登録数を決めれます。   
機能は、Gemのcocoonを使用しました。  
![b6708fba73a4362127aab06162ed3119](https://user-images.githubusercontent.com/73088476/106348062-9a067480-6306-11eb-8747-59512edea78f.gif)

### ・提出物を限定にしました
生徒側では、自身の提出した資料しか確認できません。  
教授側では、提出した生徒全員の確認ができます。  
↓生徒側の表示になります  
![09fb40c7e4374948dec257f6b224007d](https://user-images.githubusercontent.com/73088476/106348111-1ef18e00-6307-11eb-8af4-29b2f540da85.png)  
↓教授側の表示になります  
![94d30b796a0095ec9ca167789f066245](https://user-images.githubusercontent.com/73088476/106348117-2a44b980-6307-11eb-9963-0584d4a69cc1.png)



### ・Q＆Aを行った日の講義に対して質疑できるようにした
講義タイトルによって、Q&Aの内容が異なるようにしてます。  
![c2842374f1c43df971aef27c20e54098](https://user-images.githubusercontent.com/73088476/106348285-80662c80-6308-11eb-811f-070bdacdd671.png)
![3672e1ad9b438f1cdd961862cfd022ae](https://user-images.githubusercontent.com/73088476/106348288-88be6780-6308-11eb-8b5e-6775c05aa54e.png)


### ・ダウンロード式で資料の読み込みできるようにしました
https://user-images.githubusercontent.com/73088476/106348435-9fb18980-6309-11eb-80bc-5f3282ffe5e0.mp4



# 使用技術
言語：Ruby  
フレームワーク：Ruby on Rails  
フロント：Javascript(JQuery)  
テスト：RSpec  
インフラ：AWS(EC2, S3)  
ソースコード管理：GitHub  

# 機能
### ・生徒ユーザー機能
生徒のアカウント登録が可能です。
### ・教材管理機能
生徒側の教材、単位、曜日等の登録を行います。
### ・スケジュール表
スケジュールの登録と確認が行えます。
### ・生徒側の教材検索機能
教授が登録した教材を全て検索可能です。  
検索した教材から講義内容を確認できます。
### ・教授ユーザー機能
教授のアカウント登録が可能です。
### ・教材内容
教授の教材内容を記載が可能です。。
### ・教材講義管理機能
講義を行った日の内容を残せ、PowerPoint等の添付と講義内容表示できます。  
日付、提出物、Q&Aを出来るようにしております。
### ・提出物BOX
生徒の提出物をダウンロード式で確認できます。  
提出した生徒は、自分の提出部しか表示されません。  
教授は、提出した生徒全員のを確認できます。
### ・Q&A
教材講座管理機能にQ＆Aを行えます。  
Qを生徒、Aを教授になります。

# 今後の追加実装
#### ・時間割表機能
#### ・生徒のポートフォリオ機能
#### ・CSSの追加と編集
現在は、どのように見やすい表示ができるか模索して編集しております。
#### ・テストを行っていきます
まだテストを行っていない機能もあるので随時行っていきます。

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
