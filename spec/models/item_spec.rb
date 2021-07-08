require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end

  describe '商品情報の保存できる場合' do
    context "商品情報が保存できる場合" do
      it 'image,name,description,category,days_to_ship,items_status,shipping_area,shipping_charges,priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
      it 'priceが¥300~¥9999999の間であれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context "商品情報の保存できない場合" do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'days_to_shipが空では登録できないこと' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'items_statusが空では登録できないこと' do
        @item.items_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Items status must be other than 1")
      end
      it 'shipping_areaが空では登録できないこと' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'shipping_chargesが空では登録できないこと' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが¥300~¥9999999の間以外では登録できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが半角英数混合では登録できないこと' do
        @item.price = 'a123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが¥10000000以上では登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'user_idが空では登録できないこと' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
