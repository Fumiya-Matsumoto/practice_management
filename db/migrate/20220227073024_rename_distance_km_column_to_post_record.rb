class RenameDistanceKmColumnToPostRecord < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_records, :distance_km, :distance
  end
end
