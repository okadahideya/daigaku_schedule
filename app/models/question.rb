class Question < ApplicationRecord
  belongs_to :user
  belongs_to :lecture_detail
  has_many   :answers

  with_options presence: true do
    validates :question_text
  end
end
