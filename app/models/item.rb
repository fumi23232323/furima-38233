class Item < ApplicationRecord
has_one_attached :image
belongs_to:user
# has_one:order
with_options presence: true do
validates:user 
validates:item_name
validates:item_description
validates:item_category_id
validates:item_status_id
validates:delivery_charge_id
validates:prefecture_id 
validates:delivery_days_id
validates:price format: numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid'}
end
