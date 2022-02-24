class AddDistanceMToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :distance_m, :integer
  end
end
