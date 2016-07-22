require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "receiving messages" do 
   before do 

    @sender = FactoryGirl.create(:customer)
    @receiver = FactoryGirl.create(:customer, username: "Rec10", email: "rec10@gmail.com")
    @message = Message.create!(sender: @sender, content: 'wink', receiver: @receiver)

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

      describe "replying" do
        before do
          binding.pry
          @reply = Message.create!(:sender => @receiver, :content => 'I fancy you',
            :replied_to => @message)
          
          @sender.received_messages << @reply
        end

        it "should remember which message it was in reply to" do
          expect(@reply.reload.replied_to).to eq(@message)
          expect(@message.reload.reply).to eq(@reply)
        end

        # describe "history" do
        #   before do
        #     @reply_to_reply = Message.create!(:sender => @sender, :content => 'Lets go for a drink',
        #       :replied_to => @reply)
        #   end

        #   it "allows the original message to see the entire conversation history" do
        #     expect(@message.reload.history).to eq([@reply, @reply_to_reply])
        #   end
        # end
      end
  end
end



