class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.datetime :accepted_at
      t.datetime :refused_at
      t.datetime :canceled_at

      t.timestamps
    end
  end
end
