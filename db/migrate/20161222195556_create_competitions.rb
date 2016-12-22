class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.string :tba_code
      t.string :name
      t.string :city
      t.string :province
      t.string :country
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
