class CreatePostRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :post_records do |t|
      t.integer :post_id
      t.time :time
      t.float :distance_km
      t.float :distance_m
      t.string :type
      t.integer :number

      t.timestamps
    end
  end
end
