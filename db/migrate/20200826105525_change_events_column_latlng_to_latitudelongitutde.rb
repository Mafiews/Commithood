class ChangeEventsColumnLatlngToLatitudelongitutde < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :lat, :latitude
    rename_column :events, :lng, :longitude
  end
end
