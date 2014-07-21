class RenameDescToDataInCars < ActiveRecord::Migration
  def change
    rename_column :cars, :desc, :data
  end
end
