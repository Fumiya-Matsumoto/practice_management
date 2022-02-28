class AddPaceToPostRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :post_records, :pace_minute, :integer
    add_column :post_records, :pace_second, :integer
    add_column :post_records, :pace_undersecond, :integer
  end
end
