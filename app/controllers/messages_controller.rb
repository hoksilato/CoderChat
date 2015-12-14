class MessagesController < ApplicationController
  before_action :require_user, only: [:index, :new, :create, :show]

  def index
    @messages = Message.where(recipient: current_user).order(created_at: :desc)
  end

  def show
    @message = Message.find_by_id(params[:id])
    if @message.nil?
      redirect_to messages_path, flash: {error: "Message not found"}
    elsif @message.recipient != current_user
      redirect_to messages_path, flash: {error: "You only can view your received messages"}
    elsif @message.read
      flash.now[:alert] = "The message was read"
    else
      @message.mark_read
    end
  end

  def new
    @message = Message.new
  end

  def create
    recipient = User.find_by(id: params[:message][:recipient])

    if !recipient
      flash.now.error = "Please choose a recipient"
    else
      Message.create(sender: current_user, recipient: recipient, body: params[:message][:body], attachment: params[:message][:attachment])
      redirect_to messages_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :recipient)
  end
end
