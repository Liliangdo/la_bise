class MessagesController < ApplicationController

  before_action :find_message, only: [:new, :create]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new(message_params)
  end

  def create
    @message = Message.new(message_params)
    @message.event = @event
    if @message.save
      redirect_to event_path(@event)
    else
      render 'messages/new'
    end
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:messages).permit(:content)
  end
end
