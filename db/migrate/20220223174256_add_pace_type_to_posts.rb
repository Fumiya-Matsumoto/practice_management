class AddPaceTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pace_minute, :integer
    add_column :posts, :pace_second, :integer
    add_column :posts, :pace_undersecond, :integer
  end
end
