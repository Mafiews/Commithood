class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :seats
      t.integer :seats_left
      t.string :address
      t.float :lat
      t.float :lng
      t.references :association, null: false, foreign_key: true

      t.timestamps
    end
  end
end
