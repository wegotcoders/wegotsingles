class MessagesController < ApplicationController
  before_action :set_message, :only => [:update, :show]
  before_action :set_profile

  def index
    @messages = @profile.customer.received_messages
  end

  def show
  end

  def outbox
    @messages = @profile.customer.sent_messages
  end

  def new
    @message = Message.new
    @profile_ids = Profile.all.map do |profile| 
      { id: "#customer-#{profile.customer.id}",
	customer_id: profile.customer.id,
	name: profile.name
      }
    end.to_json
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      flash[:notice] = "Message has been sent"
      redirect_to profile_messages_path(@profile)
    else
      flash[:error] = "Unable to send message"
      render :new
    end
  end

  private
    def message_params
      params.require(:message).permit(:receiver_id, :sender_id, :content, 
				      :replied_to_id, :read, :visible)
    end

    def set_message
      @message = Message.find(params[:id])
    end

    def set_profile
      @profile = current_customer.profile
    end

end
