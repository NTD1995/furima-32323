class PurchasesController < ApplicationController
  def index
   @purchase_address = PurchaseAddress.new
   @item = Item.find(params[:item_id])
   @item.price
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @item = Item.find(params[:item_id])
      @item.price 
      pay_item
      @purchase_address.save
      redirect_to action: :index
    else
      render action: :index
    end
  end
  
  private
  
    def  purchase_params
      params.require(:purchase_address).permit(:postal_code, :phone_number, :house_number, :building_number, :city, :shipping_area_id, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
