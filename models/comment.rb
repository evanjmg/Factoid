class Comment < ActiveRecord::Base
  has_many :likes
  belongs_to :user
  belongs_to :fact
end