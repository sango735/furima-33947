class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.includes(:user).order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :burden_id, :state_id, :area_id, :days_id,
                                 :price).merge(user_id: current_user.id)
  end
end
