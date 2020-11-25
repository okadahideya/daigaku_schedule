class SelectGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '必修科目' },
    { id: 3, name: '選択科目' },
    { id: 4, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :subjects
end
