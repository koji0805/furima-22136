class ProductsController < ApplicationController
  def index
  end

  private

  def products_params
    params.require(:products).permit(:concept, :image).merge(user_id: current_user.id)
  end
end
