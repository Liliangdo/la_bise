class MessagesController < ApplicationController

  before_action :find_message, only: []

  def index
    @messages = Message.all
  end

  def new
    @message_pundit = policy_scope(Message)
    authorize @message_pundit
    @message = Message.new
    @event = Event.find(params[:event_id])
  end

  def create
    @message = Message.new(message_params)
    @message.event = Event.find(params[:event_id])
    authorize @message
    if @message.save
      redirect_to dashboard_path
    else
      render 'messages/new'
    end
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :recipient_id, :sender_id, :event_id)
  end
end
