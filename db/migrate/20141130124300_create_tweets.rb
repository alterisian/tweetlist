class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :value
      t.references :tweeter, index: true
      t.references :list, index: true
      t.references :hashtag, index: true

      t.timestamps
    end
  end
end
