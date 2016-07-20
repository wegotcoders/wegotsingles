class Profile < ActiveRecord::Base
  belongs_to :customer

  after_create :set_star_sign

  attr_accessor :star_sign

  private

  def set_star_sign

    dob = self.customer.date_of_birth
    month = dob.month
    day = dob.day
    star_signs = {capricorn: [12,22,1,19],
                  aquarius: [1,20,2,18],
                  pisces: [2,19,3,20],
                  aries: [3,21,4,19],
                  taurus: [4,20,5,20],
                  gemini: [5,21,6,20],
                  cancer: [6,21,7,22],
                  leo: [7,23,8,22],
                  virgo: [8,23,9,22],
                  libra: [9,23,10,22],
                  scorpio: [10,23,11,21],
                  sagittarius: [11,22,12,21]
                  }


  end
end
