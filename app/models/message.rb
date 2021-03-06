class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :user, :message, presence: true
  validates :message, length: {minimum: 11}
end
