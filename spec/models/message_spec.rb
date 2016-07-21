require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "receiving messages" do 
   before do 

    @sender = Customer.create!
    @receiver = Customer.create!
    @message = Message.new(sender: @sender, content: 'wink')
    # # Option 1:
    # Message.create!(sender: @sender, receiver: @receiver)

    # # Option 2:
    # Message.send(from: @sender, to: @receiver, content: 'wink')

    # # Option 3:
    # @sender.send_to(@receiver, 'wink')

    # # Option 4:
    # @receiver.send_message(@sender, 'wink')

    # Option 5:
   end
   
    it "should show in receivers inbox" do 
      expect(@receiver.reload.received_messages).to include(@message)
      expect(@receiver.reload.sent_messages).to eq([])
      expect(@message.reload.receiver).to eq(@receiver)
    end

    it "should show up in receiveres outbox" do 
      expect(@sender.reload.sent_messages).to include(@message)
      expect(@sender.reload.received_messages).to eq([])
    end 
  end

  describe "replying to messages" do 
   before do 
    @reply = Message.new(sender: @sender, content: 'wink', replied_to: @message)
    @sender.received_messages << @reply
   end
   
    it "should remember which mesage it was in reply to " do 
      expect(@reply.reload.replied_to).to eq(@message)
      expect(@message.reload.reply).to eq([@reply])
    end
  end

  describe "history" do 
    before do 
      @reply_to_reply =  Message.new(sender: @sender, content: 'wink', replied_to: @reply)
    end

    it "allows the original message to see the entire convo hist" do 
      expect(@message.reload.history).to eq([@reply])
    end
  end
end
