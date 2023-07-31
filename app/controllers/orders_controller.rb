class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    # @order_address = DonationAddress.new
  end

  def create
  end

end
