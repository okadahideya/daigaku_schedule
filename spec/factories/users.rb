FactoryBot.define do
  factory :user do
    nickname              { 'okada' }
    email                 { 'sample@gmail.com' }
    password              { '0511oh' }
    password_confirmation { '0511oh' }
    name                  { '日本' }
    name_k                { '太郎' }
    university            {'摂南大学'}
    undergraduate         {'経営学部'}
    department            {'経営情報学科'}
  end
end