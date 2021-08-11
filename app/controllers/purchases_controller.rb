class PurchasesController < ApplicationController
  def index
   @purchase_address = PurchaseAddress.new
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to action: :index
    else
      render action: :index
    end
  end
  
  private
  
    def  purchase_params
      params.require(:purchase_address).permit(:postal_code, :phone_number, :house_number, :building_number, :city, :shipping_area_id, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end
