class ItemsController < ApplicationController
    def index
      @items = Item.all
    end
  
    def new
      @item = Item.new
      @category = Category.all
      @condition = Condition.all
      @delivery_charge = DeliveryCharge.all
      @prefecture = Prefecture.all
      @delivery_day = DeliveryDay.all
    end
  
    def crate
    end
  
    private
  
    # def items_params
    #   params.require(:items).permit(:concept, :image).merge(user_id: current_user.id)
    # end
end
