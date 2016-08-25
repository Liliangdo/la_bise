class RemoveUserIdFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_reference :messages, :user
  end
end
