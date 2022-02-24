class AddPracticeDayDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :practice_day_year, :integer
    add_column :posts, :practice_day_month, :integer
    add_column :posts, :practice_day_day, :integer
  end
end
