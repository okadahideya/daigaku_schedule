class Subject < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :grade_genre
  belongs_to_active_hash :period_genre
  belongs_to_active_hash :result_genre
  belongs_to_active_hash :select_genre
  belongs_to_active_hash :time_genre
  belongs_to_active_hash :week_genre

  with_options presence: true do
    validates :class
    validates :unit
    validates :unit_sum
    validates :university
    validates :undergraduate
    validates :department
    validates :grade_genre_id,  numericality: { other_than: 1 }
    validates :period_genre_id, numericality: { other_than: 1 }
    validates :result_genre_id, numericality: { other_than: 1 }
    validates :select_genre_id, numericality: { other_than: 1 }
    validates :time_genre_id,   numericality: { other_than: 1 }
    validates :week_genre_id,   numericality: { other_than: 1 }
  end
end
