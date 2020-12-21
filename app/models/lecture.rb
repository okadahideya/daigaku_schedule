class Lecture < ApplicationRecord
  has_one_attached :lecture_image
  belongs_to :professor

  with_options presence: true do
    validates :lecture_title
    validates :contents
  end
end
