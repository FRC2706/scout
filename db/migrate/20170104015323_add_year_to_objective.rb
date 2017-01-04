class AddYearToObjective < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :year, :date
  end
end
