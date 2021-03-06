class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one :order
  has_one_attached :image

  with_options presence: true do
  validates :name, :description, :image
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  end

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :condition_id
  validates :delivery_charge_id
  validates :prefecture_id
  validates :delivery_day_id
  end
end