class Message < ActiveRecord::Base
  belongs_to :channel

  validates :content, presence: true
end
