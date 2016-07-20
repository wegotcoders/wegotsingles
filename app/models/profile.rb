class Profile < ActiveRecord::Base
  belongs_to :customer
  geocoded_by :postcode
  after_validation :geocode

  def display_attribute_keys
    self.attributes.keys.to_a - ['id', 'name', 'created_at', 'updated_at', 'customer_id', 'latitude', 'longitude']
  end

end
