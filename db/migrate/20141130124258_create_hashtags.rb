class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.references :tweeter, index: true

      t.timestamps
    end
  end
end
