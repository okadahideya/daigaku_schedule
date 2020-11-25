class GradeGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1回生' },
    { id: 3, name: '2回生' },
    { id: 4, name: '3回生' },
    { id: 5, name: '4回生' },
    { id: 6, name: '5回生' },
    { id: 7, name: '6回生' },
    { id: 8, name: '大学院1回生' },
    { id: 9, name: '大学院2回生' },
    { id: 10, name: '大学院3回生' },
    { id: 11, name: '大学院4回生' },
    { id: 12, name: '大学院5回生' },
    { id: 13, name: '大学院6回生' },
    { id: 14, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :subjects
end
