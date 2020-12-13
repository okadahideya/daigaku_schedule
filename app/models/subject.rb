class Subject < ApplicationRecord
  belongs_to :user
  has_many :subject_details, dependent: :destroy
  accepts_nested_attributes_for :subject_details, allow_destroy: true

  with_options presence: true do
    validates :grade_genre_id
    validates :period_genre_id
  end

end