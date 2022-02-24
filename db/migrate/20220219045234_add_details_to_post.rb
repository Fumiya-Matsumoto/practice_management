class AddDetailsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :weather, :string
    add_column :posts, :place, :string
    add_column :posts, :kind_of_practice, :string
    add_column :posts, :strength, :integer
  end
end
