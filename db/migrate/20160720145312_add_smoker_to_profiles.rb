class AddSmokerToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :smoker, :boolean
  end
end
