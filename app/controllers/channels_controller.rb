class ChannelsController < ApplicationController

  def index
    @channels = Channel.all
    respond_to do |format|
      format.json { render json: @channels }
      format.html
    end
  end

  def new 
    @channel = Channel.new
    respond_to do |format|
      format.json { render json: @channel }
      format.html
    end
  end

  def show 
    @channel = Channel.find params[:id]
    respond_to do |format|
      format.json { render json: @channel }
      format.html
    end
  end

  def edit 
    @channel = Channel.find params[:id]
    respond_to do |format|
      format.json { render json: @channel }
      format.html
    end
  end

  def create
    @channel = Channel.new(channel_params)
    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @channel = Channel.find params[:id]
    @channel.update_attributes channel_params
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel = Channel.find params[:id]
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def channel_params
    params.require(:channel).permit(:name)
  end
end
