class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :coach, index: true, foreign_key: true
      t.string :email, null: false
      t.datetime :start_time, null: false
      t.timestamps
    end
    add_index :appointments, [:coach_id, :start_time]
  end
end
