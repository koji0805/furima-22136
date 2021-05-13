require 'rails_helper'

RSpec.describe Purchase, type: :model do
    before do
      @order_form = FactoryBot.build(:order_form)
    end
  
  context '商品が購入できる時' do
      it '全てが揃えば購入できる事' do
        expect(@order_form).to be_valid
      end

    it 'buidingは空でも保存できること' do
      @order_form.building = ''
      expect(@order_form).to be_valid
    end
  
  end
  context '商品出品が購入できない時' do
     
    it 'postal_codeが空だと保存できないこと' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
  end
end  