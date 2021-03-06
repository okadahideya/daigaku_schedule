class CreateSubjectDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_details do |t|
      t.references :user,             foreign_key: true
      t.references :subject,          foreign_key: true
      t.string     :curriculum,       null: false
      t.integer    :unit,             null: false
      t.integer    :select_genre_id,  null: false
      t.integer    :week_genre_id,    null: false
      t.integer    :time_genre_id,    null: false
      t.integer    :result_genre_id,  null: false
      t.timestamps
    end
  end
end
