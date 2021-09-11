class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user
end
