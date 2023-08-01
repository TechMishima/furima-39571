class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @order = Order.find_by(item_id: params[:item_id])
    unless (current_user.id == @item.user_id) || (@order != nil)
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @order_address = OrderAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

   def order_params
     params.require(:order_address).permit(
      :user_id, :post_code, :prefecture_id, :shipping_municipality, :shipping_address, :shipping_building, :buyer_phone_number)
      .merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
   end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

end
