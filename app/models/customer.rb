class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :date_of_birth, presence: true
  validate :over_eighteen

  private
    def over_eighteen
      if self.date_of_birth.present? && self.date_of_birth > 18.years.ago
	self.errors.add(:date_of_birth, "Sorry but you're too young to use this site!")
      end
    end
end
