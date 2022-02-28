class AddTimesToPostRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :post_records, :time_hour, :integer
    add_column :post_records, :time_minute, :integer
    add_column :post_records, :time_second, :integer
    add_column :post_records, :time_undersecond, :integer
  end
end
