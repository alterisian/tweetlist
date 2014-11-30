class Tweeter < ActiveRecord::Base
  has_many :tweets
  has_many :lists
  has_many :hashtags
end
