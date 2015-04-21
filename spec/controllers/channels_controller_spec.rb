require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do

  describe 'GET #index' do 
    it 'populates an array of channels' do 
      channel = FactoryGirl.create(:channel)
      get :index, format: :json
      assigns(:channels).should eq([channel])
    end
    it 'renders the :index view' do 
      get :index, format: :json
      response.should render_template @channels
    end
  end

  describe 'GET #new' do 
    it 'assigns a new Channel to @channel' do 
      channel = FactoryGirl.create(:channel)
      get :new, format: :json
      # assigns(:channel).should eq([channel])
    end
    it 'renders the :new template' do 
      get :new, format: :json
      response.should render_template @channel
    end
  end

  describe 'GET #show' do 
    it 'assigns the requested channel to @channel' do 
      channel = FactoryGirl.create(:channel)
      get :show, format: :json, id: channel
    end 
    it 'renders the #show view' do 
      get :show, format: :json, id: FactoryGirl.create(:channel)
      response.should render_template @channel
    end
  end

  describe 'POST #create' do 
    context 'with valid attributes' do 
      it 'saves the new channel in the database' do 
        expect{
          post :create, channel: FactoryGirl.attributes_for(:channel)
        }.to change(Channel, :count).by(1)
      end
    end
    context 'with invalid attributes' do 
      it 'does not save the new channel in the database' do 
        expect{
          post :create, format: :json, channel:{
            name: '',}
          }.to_not change(Channel, :count)
      end
    end
  end

  describe 'PUT #update' do 
    before :each do 
      @channel = FactoryGirl.create(:channel, name: "Activities")
    end

    context 'valid attributes' do 
      it 'located the requested @channel' do 
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:channel)
        assigns(:channel).should eq(@channel)
      end
      it 'changes @channels attributes' do 
        put :update, id: @channel,
          channel: FactoryGirl.attributes_for(:channel, name: "Sports")
        @channel.reload
        @channel.name.should eq("Sports")
      end
      it 'redirects to the updated channel' do 
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:channel)
        response.should redirect_to @channel
      end
    end
    context 'invalid attributes' do 
      it 'locates the requested @channel' do 
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:channel)
        assigns(:channel).should eq(@channel)
      end

      it 'does not change @channels attributes' do 
        put :update, format: :json, id: @channel,
          channel: FactoryGirl.attributes_for(:channel, name: nil)
        @channel.reload
        @channel.name.should eq("Activities")
      end
    end
  end

  describe 'DELETE #destroy' do 
    before :each do 
      @channel = FactoryGirl.create(:channel)
    end

    it 'deletes the channel' do 
      expect{
        delete :destroy, id: @channel
      }.to change(Channel, :count).by(-1)
    end

    it 'redirects to channels#index' do 
      delete :destroy, id: @channel
      response.should redirect_to channels_url
    end
  end

end
