require 'faker'

FactoryGirl.define do 
  factory :message do |f|
    f.content { Faker::Lorem.paragraph}
  end
end