class Subject < ApplicationRecord
  has_many :subject_details
  has_many :users, through: :subject_details, dependent: :destroy
  accepts_nested_attributes_for :subject_details, allow_destroy: true

  with_options presence: true do
    validates :grade_genre_id
    validates :period_genre_id
  end
end
