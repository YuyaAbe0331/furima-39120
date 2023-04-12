class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :purchase_item, only: [:index, :create]
  before_action :new_purchase_address, only: [:index, :new]

  def index
    if @item.purchase
      redirect_to root_path
    else current_user == @item.user
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone).merge(user_id: current_user.id, item_id:  params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_item
    @item = Item.find(params[:item_id])
  end

  def new_purchase_address
    @purchase_address = PurchaseAddress.new 
  end

end
