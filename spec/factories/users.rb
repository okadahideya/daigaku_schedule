FactoryBot.define do
  factory :user do
    nickname              { 'okada' }
    email                 { 'sample@gmail.com' }
    password              { '0511oh' }
    password_confirmation { '0511oh' }
    name                  { '日本' }
    name_k                { '太郎' }
  end
end