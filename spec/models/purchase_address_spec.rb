require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の登録' do
    before do
      @purchase_address= FactoryBot.build(:purchase_address)
      @user = FactoryBot.build(:item_id: @item.id)
      @item = FactoryBot.build(:user_id: @user.id)
      sleep(1)
    end

      context '購入情報が登録できる場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'building_numberは空でも保存できること' do
      @purchase_address.building_number = ''
      expect(@purchase_address).to be_valid
    end
    it "priceとtokenがあれば保存ができること" do
      expect(@purchase_address).to be_valid
    end

    context '購入情報が登録できない場合'
    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'shipping_area_idが空だと保存できないこと' do
      @purchase_address.shipping_area_id= 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'phone_numberが半角のハイフンを含まなくて良い正しい形式でないと保存できないこと' do
      @purchase_address.phone_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is not invalid. Include hyphen(-)')
    end
    it 'phone_numberが11桁以内であれば登録できること' do
      @purchase_address.phone_number= '090123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
     end
    it "tokenが空では登録できないこと" do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空では登録できないこと" do
      @purchase_address.user_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User id can't be blank")
    it "item_idが空では登録できないこと" do
      @purchase_address.item_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item id can't be blank")
  end
end
