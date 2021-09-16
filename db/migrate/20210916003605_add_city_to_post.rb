class AddCityToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :city, :string
  end
end
