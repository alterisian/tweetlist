class Hashtag < ActiveRecord::Base
  belongs_to :tweeter
  has_many :tweets
end
