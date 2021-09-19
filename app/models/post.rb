class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user
  attachment :image
  geocoded_by :address

  validates :title, presence: true
  validates :city, presence: true


  validates :title, length: { maximum: 25 }
  validates :city, length: { maximum: 20 }
end
