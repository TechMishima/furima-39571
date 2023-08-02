require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep(1)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  context '商品購入できるとき' do
    it '必要情報を入力すれば購入できる' do
      expect(@order_address).to be_valid
    end
    it 'shipping_buildingを入力しなくても購入できる' do
      @order_address.shipping_building = ''
      expect(@order_address).to be_valid
    end
  end
  context '商品購入できないとき' do
    it 'post_codeが空だと購入できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが7桁の数字だと購入できない' do
      @order_address.post_code = `1234567`
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid')
    end
    it 'prefecture_idが空だと購入できない' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'shipping_municipalityが空だと購入できない' do
      @order_address.shipping_municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping municipality can't be blank")
    end
    it 'shipping_addressが空だと購入できない' do
      @order_address.shipping_address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping address can't be blank")
    end
    it 'buyer_phone_numberが空だと購入できない' do
      @order_address.buyer_phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Buyer phone number can't be blank")
    end
    it 'buyer_phone_numberが9桁の数字だと購入できない' do
      @order_address.buyer_phone_number = `123456789`
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Buyer phone number is invalid")
    end
    it 'buyer_phone_numberが12桁の数字だと購入できない' do
      @order_address.buyer_phone_number = `123456789012`
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Buyer phone number is invalid")
    end
    it 'buyer_phone_numberが3桁-4桁-4桁で入力しても購入できない' do
      @order_address.buyer_phone_number = `123-1234-1234`
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Buyer phone number is invalid")
    end
    it '都道府県に「---」が選択されている場合は購入できない' do
      @order_address.prefecture_id = `1`
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'tokenが空では購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐付いていなければ購入できない' do
      @order_address.user_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていなければ購入できない' do
      @order_address.item_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
