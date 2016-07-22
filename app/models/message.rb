class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'Customer', foreign_key: :sender_id

  belongs_to :receiver, class_name: 'Customer', foreign_key: :receiver_id
  belongs_to :replied_to, class_name: 'Message', foreign_key: :replied_to_id

  has_one :reply, class_name: 'Message', foreign_key: :replied_to_id

  validates_presence_of :receiver_id, :sender_id

  def history 
    history = []
    message = self
    while((message = message.reply) != nil)
      history << message
    end
    history
  end

end
