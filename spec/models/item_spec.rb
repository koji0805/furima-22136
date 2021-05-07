require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do

    it '全てが揃えば登録できる事' do
      expect(@item).to be_valid
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end


    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end

    it '配送料の負担についての情報が必須であること' do
    @item.delivery_charge_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge is not a number")
    end

    it '発送元の地域についての情報が必須であること' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end

    it '発送までの日数についての情報が必須であること' do
    @item.delivery_day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery day is not a number")
    end

    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end

    it 'priceが300円未満では保存できないこと' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '販売価格は全角数字だと保存できないこと' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
    end
  end
end