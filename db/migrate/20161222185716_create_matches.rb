class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :number
      t.string :scout
      t.text :human_player_notes
      t.text :general_notes
      t.datetime :start
      t.timestamps
    end
  end
end
