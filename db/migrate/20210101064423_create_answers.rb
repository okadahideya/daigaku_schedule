class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :professor, foreign_key: true
      t.references :question,  foreign_key: true
      t.text       :answer_text, null: false
      t.timestamps
    end
  end
end
