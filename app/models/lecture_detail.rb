class LectureDetail < ApplicationRecord
  has_one_attached :lecture_office
  belongs_to :professor
  belongs_to :lecture
  has_many :submissions, dependent: :destroy
  has_many :questions

  with_options presence: true do
    validates :lecture_date
    validates :lecture_title_list
    validates :lecture_office
  end
end
