class CreateTeamData < ActiveRecord::Migration[5.0]
  def change
    create_table :team_data do |t|
      t.string :kind
      t.text :data
      t.timestamps

      t.belongs_to :team, index: true
      t.belongs_to :competition, index: true
    end
  end
end
