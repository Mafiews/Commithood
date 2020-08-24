class CreateAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :associations do |t|
      t.string :name
      t.string :kbis
      t.text :description
      t.string :phone_number
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
