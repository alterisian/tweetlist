class Tweeter < ActiveRecord::Base
  has_many :tweets
  has_many :lists
end
