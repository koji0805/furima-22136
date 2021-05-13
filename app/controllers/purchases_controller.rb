class PurchasesController < ApplicationController
  before_action :set_item, only: [:index,:create]
  before_action :move_to_index, only: [:index,:create]
  before_action :move_to_create, only: [:index,:create]
  def index
    @order_form = OrderForm.new
  end
  
  def create
    @order_form = OrderForm.new(purchases_params)
    if @order_form.valid?
      Payjp.api_key = "sk_test_cecb6f356b4f896b54a0cded"  
      Payjp::Charge.create(
        amount: set_item[:price], 
        card: purchases_params[:token],  
        currency: 'jpy'         
      )
       @order_form.save
       redirect_to root_path
    else
      render action: :index
    end
  end
  
  private 

  def purchases_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :address1, :address2, :telephone, :building).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def orders_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_create
    if @item.order != nil
      redirect_to root_path
    end
  end
end