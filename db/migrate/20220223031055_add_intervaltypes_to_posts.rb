class AddIntervaltypesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :dash, :string
    add_column :posts, :interval, :string
  end
end
