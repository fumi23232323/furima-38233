class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
  end
  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
