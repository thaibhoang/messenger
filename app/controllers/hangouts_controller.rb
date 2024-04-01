class HangoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @messages = Message.all.includes(:user)
  end
end
