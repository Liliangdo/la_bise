class AddCanceledAtToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :canceled_at, :datetime
  end
end
