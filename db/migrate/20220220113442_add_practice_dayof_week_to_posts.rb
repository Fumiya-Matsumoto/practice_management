class AddPracticeDayofWeekToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :practice_day_of_week, :string
  end
end
