class CreateObjectives < ActiveRecord::Migration[5.0]
  def change
    create_table :objectives do |t|
      t.string :name
      t.decimal :points, precision: 6, scale: 4
      t.timestamps
    end
  end
end
