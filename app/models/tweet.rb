class Tweet < ActiveRecord::Base
  belongs_to :tweeter
  belongs_to :list
  belongs_to :hashtag
  acts_as_votable 
end
