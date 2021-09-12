class RemovePrefecture3IdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :prefecture3_id, :integer
  end
end
