class LectureDetail < ApplicationRecord
  has_one_attached :lecture_office
  belongs_to :professor
  belongs_to :lecture

  with_options presence: true do
    validates :lecture_date
    validates :lecture_title_list
  end
end
