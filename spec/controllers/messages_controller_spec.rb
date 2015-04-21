require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe 'GET #index' do 
    it 'populates an array of messages' do 
      channel = FactoryGirl.create(:channel)
      message = FactoryGirl.create(:message)
      get :index, format: :json, channel_id: channel
      assigns(:messages).should eq([message])
    end
    it 'renders the :index view' do 
      channel = FactoryGirl.create(:channel)
      get :index, format: :json, channel_id: channel
    end
  end

  describe 'GET #show' do 
    it 'assigns the requested message to @message'
    it 'renders the :show template'
  end

  describe 'GET #new' do 
    it 'assigns a new Message to @message'
    it 'renders the :new template'
  end

end
