class ResultGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '取得' },
    { id: 3, name: '落第' }
  ]
  include ActiveHash::Associations
  has_many :subjects
end
