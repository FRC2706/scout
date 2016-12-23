class Relationships < ActiveRecord::Migration[5.0]
  def change
    change_column_null :objectives, :name, false
    change_column_default :objectives, :points, 0.0
    change_column_default :events, :success, false
    add_column :autonomies, :success, :boolean, default: false
    change_column_null :matches, :number, false
    add_column :matches, :device_id, :string
    change_column_null :teams, :number, false
    change_column_null :teams, :name, false
    change_column_null :competitions, :name, false

    change_table :events do |t|
      t.belongs_to :objective, index: true
      t.belongs_to :match, index: true
    end

    change_table :autonomies do |t|
      t.belongs_to :objective, index: true
      t.belongs_to :match, index: true
    end

    change_table :matches do |t|
      t.belongs_to :competition, index: true
      t.belongs_to :team, index: true
    end
  end
end
