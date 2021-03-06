class PurchasesController < ApplicationController
  before_action :authenticate_user! 
  before_action :move_index, only: [:index, :create]
 
  def index
   @purchase_address = PurchaseAddress.new
   @item = Item.find(params[:item_id])
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def move_index
    @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to items_path
    end
  end
  
  private
  
    def  purchase_params
      params.require(:purchase_address).permit(:postal_code, :phone_number, :house_number, :building_number, :city, :shipping_area_id,).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
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
