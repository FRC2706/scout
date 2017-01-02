class TeamAdditions < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :rookie_year, :integer
    add_column :teams, :locality, :string
    add_column :teams, :region, :string
    add_column :teams, :country, :string
  end
end
