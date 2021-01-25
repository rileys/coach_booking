class CreateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :coaches do |t|
      t.string :name, null: false, index: true
      t.string :time_zone_string, null: false
      t.string :time_zone, null: false
      t.timestamps
    end
  end
end
