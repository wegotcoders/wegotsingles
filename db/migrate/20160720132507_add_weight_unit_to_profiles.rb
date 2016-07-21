class AddWeightUnitToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :weight_unit, :string
  end
end
