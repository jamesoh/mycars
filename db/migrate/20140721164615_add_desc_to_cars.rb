class AddDescToCars < ActiveRecord::Migration
  def change
    add_column :cars, :desc, :text
  end
end
