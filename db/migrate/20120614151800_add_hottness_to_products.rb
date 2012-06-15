class AddHottnessToProducts < ActiveRecord::Migration
  def change
    add_column :products, :hottness, :boolean
  end
end
