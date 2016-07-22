class AddHeightToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :height, :integer, :default => 0
  end
end
