class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
      t.string :handle
      t.string :access_token
      t.string :access_token_secret
      t.integer :followers
      t.integer :following
      t.integer :influence
      t.integer :tweet_count

      t.timestamps
    end
  end
end
