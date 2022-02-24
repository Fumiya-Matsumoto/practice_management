class RemoveIntervaltypesFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :dash, :string
    remove_column :posts, :interval, :string
  end
end
