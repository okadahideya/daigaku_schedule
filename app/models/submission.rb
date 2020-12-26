class Submission < ApplicationRecord
  has_one_attached :user_office
  belongs_to :user
  belongs_to :lecture_detail
end
