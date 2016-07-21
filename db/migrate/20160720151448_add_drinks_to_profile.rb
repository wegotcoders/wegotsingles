class AddDrinksToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :drinks, :boolean
  end
end
