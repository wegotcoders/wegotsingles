class AddIndustryToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :industry, :string
  end
end
