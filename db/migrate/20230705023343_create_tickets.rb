class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :car, null: false, foreign_key: true
      t.integer :spot_number

      t.timestamps
    end
  end
end
