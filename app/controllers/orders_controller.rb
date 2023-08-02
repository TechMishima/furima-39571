class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.find_by(item_id: params[:item_id])
    if (current_user.id == @item.user_id) || !@order.nil?
      redirect_to root_path
    else
      gon_key
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon_key
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :post_code, :prefecture_id, :shipping_municipality, :shipping_address, :shipping_building, :buyer_phone_number
    )
          .merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def gon_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

end
