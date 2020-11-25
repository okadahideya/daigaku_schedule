class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
    t.references :user,      foreign_key: true
    t.string     :class,        null: false
    t.integer    :unit,         null: false
    t.integer    :priod_genre,  null: false
    t.integer    :select_genre, null: false
    t.integer    :week_genre,   null: false
    t.integer    :time_genre,   null: false
    t.integer    :grade_genre,  null: false
    t.integer    :result_genre, null: false
    t.integer    :unit_sum,     null: false
    t.string     :university,   null: false
    t.string     :string,       null: false
    t.string     :department,   null: false
    t.timestamps
    end
  end
end
