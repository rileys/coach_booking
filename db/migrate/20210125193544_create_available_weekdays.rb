class CreateAvailableWeekdays < ActiveRecord::Migration[6.0]
  def change
    create_table :available_weekdays do |t|
      t.belongs_to :coach, index: true, foreign_key: true
      t.integer :weekday, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.timestamps
    end
  end
end
