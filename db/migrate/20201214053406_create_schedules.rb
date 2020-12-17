class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :user,  foreign_key: true
      t.string :title,     null: false 
      t.date   :start_time,      null: false
      t.text   :text
      t.string :area
      t.time   :time
      t.timestamps
    end
  end
end
