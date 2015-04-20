require 'faker'

FactoryGirl.define do 
  factory :channel do |f|
    f.name { Faker::Name.name}
  end
end