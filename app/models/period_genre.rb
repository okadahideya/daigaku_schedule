class PeriodGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '前期' },
    { id: 3, name: '後期' },
    { id: 4, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :subjects
end
