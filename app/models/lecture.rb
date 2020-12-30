class Lecture < ApplicationRecord
  has_one_attached :lecture_image
  belongs_to :professor
  has_many   :lecture_details, dependent: :destroy

  with_options presence: true do
    validates :lecture_title
    validates :contents
  end

  def self.search(search)
    return Lecture.all unless search
     Lecture.where(['lecture_title LIKE?', "%#{search}%"])
  end

end
