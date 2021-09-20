class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  attachment :image
  geocoded_by :address

  validates :title, presence: true
  validates :city, presence: true
  validates :evaluation, presence: true


  validates :title, length: { maximum: 25 }
  validates :city, length: { maximum: 20 }
end
