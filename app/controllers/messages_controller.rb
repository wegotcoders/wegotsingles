class MessagesController < ApplicationController

	before_action :set_message, :only => [:update, :show]

	def index
	end

	def show
	end

	def new
	end

	def create
	end

private

	def message_params
    params.require(:message).permit(:receiver_id, :sender_id, :content, :replied_to_id, :read, :visible)
	end

  def set_message
    @message = Message.find(params[:id])
  end


end