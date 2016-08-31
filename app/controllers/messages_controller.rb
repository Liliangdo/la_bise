class MessagesController < ApplicationController

  before_action :find_message, only: [:update, :edit]

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
    message_load
    @message.event = Event.find(params[:event_id])
    authorize @message
    if @message.save
      redirect_to dashboard_path
    else
      render 'messages/new'
    end
  end

  def edit
    message_load
    @message.update
  end

  def update
    @message.update(message_params)
    authorize @message
    redirect_to dashboard_path
  end

  private

  def find_message
    @message = Message.find(params[:message][:message_id].to_i)
  end

  def message_params
    params.require(:message).permit(:content, :recipient_id, :sender_id, :event_id)
  end

  def message_load
    @message.content = "#{@message.content}\n#{'-' * 3} \n#{@message.sender_id} at #{@message.created_at}\n#{'-' * 50}\n"
  end
end
