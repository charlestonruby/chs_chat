require 'rails_helper'

RSpec.describe Channel, type: :model do
  it 'has a valid factory' do 
    FactoryGirl.create(:channel).should be_valid
  end
  it 'is invalid without a name' do 
    FactoryGirl.build(:channel, name: nil).should_not be_valid
  end
  it 'returns a channels name as a string' do 
    FactoryGirl.build(:channel, name: "default").name.should == "default"
  end
  
end
