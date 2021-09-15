class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :body1, :text
    add_column :posts, :body2, :text
    add_column :posts, :body3, :text
  end
end
