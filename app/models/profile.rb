class Profile < ActiveRecord::Base
  belongs_to :customer
  geocoded_by :postcode
  after_validation :geocode
  mount_uploaders :images, ImageUploader, s3_protocol: :https

  def display_attribute_keys
    self.attributes.keys.to_a - ['id', 'name', 'created_at', 'updated_at', 'customer_id', 'latitude', 'longitude', 'weight_unit', 'images']
  end

  after_create :set_star_sign

  attr_accessor :star_sign

  def set_star_sign

    dob = self.customer.date_of_birth
    year = dob.year

    star_signs = {capricorn: [Date.new(year,12,20),Date.new(year, 1,19)],
                  aquarius: [Date.new(year,1,20), Date.new(year,2,18)],
                  pisces: [Date.new(year,2,19),Date.new(year,3,20)],
                  aries: [Date.new(year,3,21), Date.new(year,4,19)],
                  taurus: [Date.new(year,4,20), Date.new(year,5,20)],
                  gemini: [Date.new(year,5,21),Date.new(year,6,20)],
                  cancer: [Date.new(year,6,21),Date.new(year,7,22)],
                  leo: [Date.new(year,7,23),Date.new(year,8,22)],
                  virgo: [Date.new(year,8,23),Date.new(year,9,22)],
                  libra: [Date.new(year,9,23), Date.new(year,10,22)],
                  scorpio: [Date.new(year,10,23),Date.new(year,11,21)],
                  sagittarius: [Date.new(year,11,22),Date.new(year,12,21)]
                  }

    self.star_sign = star_signs.find do |key,value|
      dob.between?(value.first,value.last)
    end.first.to_s
  end

  validates :weight, numericality: {only_integer: true, greater_than_or_equal_to: 0}, allow_blank: true

  def self.calculate_weight(params)
    if params[:weight_unit] == 'Imperial'
      return self.convert_imperial(params[:stones], params[:pounds])
    else
      return params[:weight]
    end
  end

  def self.convert_imperial(stones, pounds)
    weight = ((stones.to_f * 14 + pounds.to_f) / 2.2).round
  end

  def self.convert_metric(weight)
    stones = (weight * 2.2 / 14).floor
    pounds = ((weight * 2.2) % 14).floor
    [stones, pounds]
  end

  def imperial_height
    unless self.height.nil?
      height_in_inches = (self.height * 0.3937)
      feet = (height_in_inches / 12).to_i
      inches = height_in_inches.to_i % 12
      return "(#{feet} ft #{inches} in)"
    end
  end
end
