class AddColumnToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :flexible, :boolean
  end
end
