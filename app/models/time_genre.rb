class TimeGenre < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１限目' },
    { id: 3, name: '２限目' },
    { id: 4, name: '３限目' },
    { id: 5, name: '４限目' }
    { id: 6, name: '５限目' },
    { id: 7, name: '６限目' },
    { id: 8, name: '７限目' },
    { id: 9, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :subjects
end
