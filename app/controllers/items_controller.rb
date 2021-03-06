class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :show, :edit, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, except: [:new, :index, :create, :show]
  before_action :move_to_create, only: [:edit, :update, :destory]
    def index
      @items = Item.includes(:user).order("created_at DESC")
    end
  
    def new
      @item = Item.new
    end
  
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
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
        redirect_to item_path(params[:id])
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
      params.require(:item).permit(:name, :image, :description,:category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, :image,).merge(user_id: current_user.id)
    end

    def move_to_index
      unless current_user.id == @item.user.id
        redirect_to action: :index
      end
    end

    def set_item
      @item = Item.find(params[:id])
    end

   def move_to_create
    if @item.order != nil
      redirect_to root_path
    end
   end
  end