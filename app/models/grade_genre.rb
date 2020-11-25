class GradeGenre < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１回生' },
    { id: 3, name: '２回生' },
    { id: 4, name: '３回生' },
    { id: 5, name: '４回生' },
    { id: 6, name: '５回生' },
    { id: 7, name: '６回生' },
    { id: 8, name: '大学院１回生' },
    { id: 9, name: '大学院２回生' },
    { id: 10, name: '大学院３回生' },
    { id: 11, name: '大学院４回生' },
    { id: 12, name: '大学院５回生' },
    { id: 13, name: '大学院６回生' },
    { id: 14, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :subjects
end
