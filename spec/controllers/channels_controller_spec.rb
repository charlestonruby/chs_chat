require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do

  describe 'GET #index' do 
    it 'populates an array of channels'
    it 'renders the :index view'
  end

  describe 'GET #new' do 
    it 'assigns a new Channel to @channel'
    it 'renders the :new template'
  end

  describe 'POST #create' do 
    context 'with valid attributes' do 
      it 'saves the new channel in the database'
    end
  end

end
