class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.references :tweeter, index: true

      t.timestamps
    end
  end
end
