class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :vin
      t.string :desc
      t.integer :user_id

      t.timestamps
    end
    add_index :cars, [:user_id, :created_at]
  end
end
