class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @message = @user.messages.build(message_params)
    @message.save
    ActionCable.server.broadcast('message', @message.as_json(include: :user))    
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
