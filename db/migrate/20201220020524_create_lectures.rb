class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.references :professor
      t.string     :lecture_title
      t.text       :contents
      t.timestamps
    end
  end
end
