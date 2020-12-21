class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.references :professor,     foreign_key: true
      t.string     :lecture_title, null: false
      t.text       :contents,      null: false
      t.timestamps
    end
  end
end
