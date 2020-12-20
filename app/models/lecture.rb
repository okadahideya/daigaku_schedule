class Lecture < ApplicationRecord
  has_one_attached :lecture_image
  belongs_to :professor
end
