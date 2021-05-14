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

    it "tokenが空では登録できないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'address1が空だと保存できないこと' do
      @order_form.address1 = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address1 code can't be blank")
    end

    it 'address2が空だと保存できないこと' do
      @order_form.address2 = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address2 code can't be blank")
    end

    it 'telephoneが空だと保存できないこと' do
      @order_form.telephone = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone code can't be blank")
    end

    it 'prefecture_idが空だと保存できないこと' do
      @order_form.prefecture_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture_id code can't be blank")
    end
  end
end  