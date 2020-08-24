class CreateAssociationCauses < ActiveRecord::Migration[6.0]
  def change
    create_table :association_causes do |t|
      t.references :association, null: false, foreign_key: true
      t.references :cause, null: false, foreign_key: true

      t.timestamps
    end
  end
end
