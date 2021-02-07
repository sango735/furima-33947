class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_index, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      order_pay
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def redirect_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end
  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :municipality, :town, :building_name, :phone_number).merge(token: params[:token],price: @item.price,user_id: current_user.id, item_id: @item.id)
  end
  def order_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
