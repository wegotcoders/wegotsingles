class Message < ActiveRecord::Base


	# Sender
  # 1)SQL:
  # SELECT * FROM customers left join messages on messages.sender_id = custoemrs.id where senders_id = #{sender_id}
  # 2) Load model
  #  

	belongs_to :sender, class_name: 'Customer', foreign_key: :sender_id

	# Receiver
	belongs_to :receiver, class_name: 'Customer', foreign_key: :receiver_id

	belongs_to :replied_to, class_name: 'Message', foreign_key: :replied_to_id

	has_one :reply, class_name: 'Message', foreign_key: :replied_to_id

  #like paper trail gem.  alternative is using a sequence number / conversation style.
  #read message - flip a bool when showing the message.
  #after_create on customer - sent fake message.
	def history 
		history = []
		message = self
		while((message = message.reply) != nil)
			history << message
		end
		history
	end

end
