class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    @item.category_id = 1 if @item.category_id.nil?

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    return if current_user.id == @item.user_id

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :price, :category_id, :sales_status_id,
                                 :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
