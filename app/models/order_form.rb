class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :address1, :address2, :telephone, :building, :item_id, :token

  with_options presence: true do
    validates :address1, :address2, :token, :user_id,:item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

    end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Purchase.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, telephone: telephone, building: building, user_id: user_id)
  end
end