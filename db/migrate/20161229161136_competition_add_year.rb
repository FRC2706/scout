class CompetitionAddYear < ActiveRecord::Migration[5.0]
  def change
    add_column :competitions, :year, :date
  end
end
