class MatchAdditions < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :time_defending, :integer
    add_column :matches, :time_dead, :integer
  end
end
