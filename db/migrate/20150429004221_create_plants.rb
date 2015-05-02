class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :seed_condition
      t.float :soil_ph
      t.float :total_dissolved_solids
      t.string :nutrients
      t.string :watering_schedule
      t.float :temperature
      t.float :humidity
      t.string :light_condition
      t.string :season
      t.string :soil_area
      t.string :maximum_reported_yield

      t.timestamps null: false
    end
  end
end
