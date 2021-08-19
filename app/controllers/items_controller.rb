class ItemsController < ApplicationController
  before_action :authenticate_user! ,except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_edit, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :index 
    end
  end

  def set_edit
    if  @item.purchase.present?
      redirect_to root_path
    end
  end
end


private

def item_params
  params.require(:item).permit(:image, :name, :description, :category_id, :items_status_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
end