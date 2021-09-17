class AddRegionToPrefecture < ActiveRecord::Migration[5.2]
  def change
    add_column :prefectures, :region, :string
  end
end
