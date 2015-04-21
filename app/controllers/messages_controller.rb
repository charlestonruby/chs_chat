class MessagesController < ApplicationController

  def index
    @channel = Channel.find params[:channel_id]
    @messages = @channel.messages
    respond_to do |format|
      format.json { render json: @messages }
    end
  end

  def show
    @message = Message.find params[:id]
  end

  def new
    @channel = Channel.find params[:channel_id]
    @message = @channel.messages.new
    respond_to do |format|
      format.json { render json: @message }
    end
  end

  def edit
    @message = Message.find params[:id]
    render :json => @message
  end

  def create
    @channel = Channel.find params[:channel_id]
    @message = @channel.messages.create message_params
    render :json => @message
  end

  def update
    @message = Message.find params[:id]
    @message.update_attributes message_params
    render :json => @message
  end

  def destroy
    @message = Message.find params[:id]
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


private 
  def message_params
    params.require(:content).permit(:content)
  end
end
