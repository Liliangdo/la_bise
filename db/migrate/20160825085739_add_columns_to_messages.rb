class AddColumnsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :sender
    add_reference :messages, :recipient
  end
end
