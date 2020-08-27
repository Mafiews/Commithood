class CreateEventCauses < ActiveRecord::Migration[6.0]
  def change
    create_table :event_causes do |t|
      t.references :cause, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
