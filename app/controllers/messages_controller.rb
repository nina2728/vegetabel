class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @Message = Message.new
  end

  def create
    @message = Message.new(text: params[:message][:text])
end
