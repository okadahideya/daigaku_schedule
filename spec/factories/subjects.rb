FactoryBot.define do
  factory :subject do
    curriculum       {'IT科目'}
    unit             { 2 }
    unit_sum         { 25 }
    university       {'摂南大学'}
    undergraduate    {'経営学部'}
    department       {'経営情報学科'}
    grade_genre_id   { 2 }
    period_genre_id  { 2 }
    result_genre_id  { 2 }
    select_genre_id  { 2 }
    time_genre_id    { 2 }
    week_genre_id    { 2 }
    association :user
  end
end