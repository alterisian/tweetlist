class AddTweeterToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :tweeter, index: true
  end
end
