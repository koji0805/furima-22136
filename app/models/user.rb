class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :nickname
         with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' Full-width characters' } do
         validates :birthday, presence: true
         end
end
