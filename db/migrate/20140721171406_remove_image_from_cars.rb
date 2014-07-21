class RemoveImageFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :image, :string
  end
end
