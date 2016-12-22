class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.decimal :position_x, precision: 10, scale: 4
      t.decimal :position_y, precision: 10, scale: 4
      t.datetime :start_time
      t.integer :duration
      t.boolean :success
      t.timestamps
    end
  end
end
