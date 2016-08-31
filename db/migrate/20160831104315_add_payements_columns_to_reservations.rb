class AddPayementsColumnsToReservations < ActiveRecord::Migration[5.0]
  def change
    change_table :reservations do |t|
      t.string :state
      t.string :event_sku
      t.monetize :amount, currency: { present: false }
      t.json :payment
    end
  end
end
