class AddPostcodeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :postcode, :string
    add_column :profiles, :latitude, :decimal
    add_column :profiles, :longitude, :decimal
  end
end
