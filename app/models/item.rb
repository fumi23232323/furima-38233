class Item < ApplicationRecord
#  ActiveHash_アソシエーション
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_category
belongs_to :item_status
belongs_to :delivery_charge
belongs_to :prefecture
belongs_to :delivery_days

# Active_storage1_アソシエーション
has_one_attached :image

belongs_to :user
# has_one:order

with_options presence: true do
validates:image
validates:item_name
validates:item_description
validates:item_category_id
validates:item_status_id
validates:delivery_charge_id
validates:prefecture_id 
validates:delivery_days_id
validates:price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, format: { with: /\A[0-9]+\z/ }
end

with_options numericality: { other_than: 0 } do
  validates :item_category_id
  validates :item_status_id
  validates :delivery_charge_id
  validates :prefecture_id 
  validates :delivery_days_id
end

end