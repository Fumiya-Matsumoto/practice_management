class AddPracticeTimrDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :time_hour, :integer
    add_column :posts, :time_minute, :integer
    add_column :posts, :time_second, :integer
  end
end
