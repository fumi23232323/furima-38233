class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building, :phonenumber, :token

  with_options presence: true do
  # Orderモデルのバリデーション
  validates :user_id
  validates :item_id
  # delivery_addressesテーブルのバリデーション
  validates :postal_code, format:  { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"  }
  validates :city
  validates :block
  validates :phonenumber, format:  { with: /\A\d{10,11}\z/, message: 'is invalid'  }
  validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(order_id: order_id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phonenumber: phonenumber)  
  end
end
