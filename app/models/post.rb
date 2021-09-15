class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user
  attachment :image
  geocoded_by :address
end
