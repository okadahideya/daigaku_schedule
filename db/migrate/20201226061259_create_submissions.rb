class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.references :user,            foreign_key: true
      t.references :lecture_detail,  foreign_key: true
      t.timestamps
    end
  end
end
