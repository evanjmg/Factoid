class Category < ActiveRecord::Base
  has_many :facts
  belongs_to :facts
end