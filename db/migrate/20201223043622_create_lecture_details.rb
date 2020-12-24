class CreateLectureDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :lecture_details do |t|
      t.references :professor,  foreign_key: true
      t.references :lecture,    foreign_key: true
      t.date       :lecture_date, null: false
      t.string     :lecture_title_list, null: false
      t.text       :lecture_text
      t.timestamps
    end
  end
end
