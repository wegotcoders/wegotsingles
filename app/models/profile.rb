class Profile < ActiveRecord::Base
  belongs_to :customer
  geocoded_by :postcode
  after_validation :geocode
end
