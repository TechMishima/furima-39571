class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :shipping_municipality, :shipping_address, :shipping_building,
                :buyer_phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_municipality
    validates :shipping_address
    validates :buyer_phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)

    Address.create(post_code:, prefecture_id:, shipping_municipality:,
                   shipping_address:, shipping_building:, buyer_phone_number:, order_id: order.id)
  end
end
