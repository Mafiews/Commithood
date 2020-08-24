class CreateUserCauses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_causes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cause, null: false, foreign_key: true

      t.timestamps
    end
  end
end
