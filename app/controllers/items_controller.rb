class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find_id, only: [:show, :edit, :update, :redirect_index, :destroy]
  before_action :redirect_index, only: [:edit, :update, :destroy]

  def index
    @item = Item.includes(:user).order(id: 'DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.user_id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :burden_id, :state_id, :area_id, :days_id,
                                 :price).merge(user_id: current_user.id)
  end

  def item_find_id
    @item = Item.find(params[:id])
  end

  def redirect_index
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
