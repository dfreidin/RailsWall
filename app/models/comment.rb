class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  validates :user, :message, :comment, presence: true
  validates :comment, length: {minimum: 11}
end
