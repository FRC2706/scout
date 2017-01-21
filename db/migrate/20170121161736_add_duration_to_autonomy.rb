class AddDurationToAutonomy < ActiveRecord::Migration[5.0]
  def change
    add_column :autonomies, :duration, :integer
  end
end
