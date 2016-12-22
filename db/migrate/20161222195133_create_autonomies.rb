class CreateAutonomies < ActiveRecord::Migration[5.0]
  def change
    create_table :autonomies do |t|
      t.decimal :start_x, precision: 10, scale: 4
      t.decimal :start_y, precision: 10, scale: 4
      t.decimal :end_x, precision: 10, scale: 4
      t.decimal :end_y, precision: 10, scale: 4
      t.timestamps
    end
  end
end
