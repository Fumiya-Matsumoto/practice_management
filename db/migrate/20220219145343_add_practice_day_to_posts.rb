class AddPracticeDayToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :practice_day, :date
  end
end
