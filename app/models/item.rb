class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one_attached :image

  validates :title, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
end