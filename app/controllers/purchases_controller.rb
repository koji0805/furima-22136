class PurchasesController < ApplicationController
  before_action :set_item, only: [:index,:create]

  def index
    @order_form = OrderForm.new
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end
  
  def create
    @order_form = OrderForm.new(purchases_params)
    if @order_form.valid?
      Payjp.api_key = "sk_test_cecb6f356b4f896b54a0cded"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: set_item[:price],  # 商品の値段
        card: purchases_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
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
end