class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :user,           foreign_key: true
      t.references :lecture_detail, foreign_key: true
      t.text       :question_text,  null: false
      t.timestamps
    end
  end
end
