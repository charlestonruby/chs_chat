require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a valid factory' do 
    FactoryGirl.create(:message).should be_valid
  end
  it 'is invalid without content' do 
    FactoryGirl.build(:message, content: nil).should_not be_valid
  end
  it 'returns a messages content as text' do 
    FactoryGirl.build(:message, content: "lorem").content.should == "lorem"
  end
end
