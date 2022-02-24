class AddPracticeDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :distance, :integer
    add_column :posts, :time, :integer
  end
end
