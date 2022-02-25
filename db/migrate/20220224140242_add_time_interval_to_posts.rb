class AddTimeIntervalToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :time_hour_interval, :integer
    add_column :posts, :time_minute_interval, :integer
    add_column :posts, :time_second_interval, :integer
  end
end
