class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  belongs_to :prefecture1, class_name: "Prefecture"
  belongs_to :prefecture2, class_name: "Prefecture"
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true
  validates :prefecture1_id, presence: true
  validates :prefecture2_id, presence: true

  validates :name, length: { maximum: 10 }
end
