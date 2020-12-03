class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
    t.references :user,             foreign_key: true
    t.integer    :period_genre_id,  null: false
    t.integer    :grade_genre_id,   null: false
    t.timestamps
    end
  end
end
