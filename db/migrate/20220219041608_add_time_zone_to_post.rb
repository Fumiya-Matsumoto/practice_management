class AddTimeZoneToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :practice_timezone, :string
  end
end
