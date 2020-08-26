class ChangeDateToBeDatetimeInEvents < ActiveRecord::Migration[6.0]
  def up
    change_column :events, :start_date, :datetime
    change_column :events, :end_date, :datetime
  end

   def down
    change_column :events, :start_date, :date
    change_column :events, :end_date, :date
  end
end
