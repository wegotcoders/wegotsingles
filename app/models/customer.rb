class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:username]
  validates :username, presence: true, uniqueness: true
  validates :date_of_birth, presence: true
  validate :over_eighteen

  has_one :profile


  ## Messages sent to me
  # 1)SQL:
  # SELECT * FROM messages where messages.receiver_id=#{self.id}
  # 2) Create models for 
  has_many :received_messages, class_name: 'Message', foreign_key: :receiver_id

  ## Messages sent by me
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id



  after_create :make_profile

  private
    def over_eighteen
      if self.date_of_birth.present? && self.date_of_birth > Date.today - 18.years
	self.errors.add(:date_of_birth, "Sorry but you're too young to use this site!")
      end
    end

  def make_profile
    Profile.create!(:customer => self)
  end
end
