class AddPrefectureRef2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :prefecture3, foreign_key: true
  end
end
