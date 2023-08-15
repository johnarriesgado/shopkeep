class AddUserToConsumers < ActiveRecord::Migration[5.0]
  def change
    add_reference :consumers, :user, foreign_key: true
  end
end
