class AddReligiousBeliefsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :religious_beliefs, :integer
  end
end
