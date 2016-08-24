class AddColumnToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :guest, :integer
  end
end
