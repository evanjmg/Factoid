class Fact < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :categories
  belongs_to :categories
end