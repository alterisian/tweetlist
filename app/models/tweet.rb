class Tweet < ActiveRecord::Base
  belongs_to :tweeter
  belongs_to :list
  belongs_to :hashtag
end
