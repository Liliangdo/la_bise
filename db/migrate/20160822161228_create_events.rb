class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price
      t.string :mood
      t.string :group_age
      t.string :option
      t.string :house_type
      t.integer :capacity
      t.datetime :starting_at

      t.timestamps
    end
  end
end
