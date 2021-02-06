class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_index, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
  end
  def create
  end

  private
  def redirect_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

end
