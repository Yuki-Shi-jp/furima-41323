class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end
end

private

def item_params
  params.require(:item).permit(:image).merge(user_id: current_user.id)
end
