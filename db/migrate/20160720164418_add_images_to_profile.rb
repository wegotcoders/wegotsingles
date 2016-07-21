class AddImagesToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :images, :string, array: true, default: []
  end
end
