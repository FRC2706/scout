class TeamDropNameConstraint < ActiveRecord::Migration[5.0]
  def change
    change_column_null :teams, :name, true
  end
end
