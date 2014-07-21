class RemoveMakeAndModelAndYearFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :make, :string
    remove_column :cars, :model, :string
    remove_column :cars, :year, :string
  end
end
