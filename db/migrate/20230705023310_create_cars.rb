class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :registration_number
      t.string :color

      t.timestamps
    end
  end
end
