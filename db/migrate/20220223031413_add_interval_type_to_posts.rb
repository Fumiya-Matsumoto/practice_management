class AddIntervalTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :interval_type, :string
  end
end
