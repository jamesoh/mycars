class RemoveDescFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :desc, :string
  end
end
