class User < ActiveRecord::Base
  has_many :facts
  has_many :comments
  has_many :likes
end