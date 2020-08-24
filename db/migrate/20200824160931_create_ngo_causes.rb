class CreateNgoCauses < ActiveRecord::Migration[6.0]
  def change
    create_table :ngo_causes do |t|
      t.references :cause, null: false, foreign_key: true
      t.references :ngo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
