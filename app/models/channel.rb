class Channel < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  validates :name, presence: true
end
