class Answer < ApplicationRecord
  belongs_to :professor
  belongs_to :question

  with_options presence: true do
    validates :answer_text
  end
end
