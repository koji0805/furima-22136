require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do

  context '商品出品ができる時' do
    it '全てが揃えば登録できる事' do
      expect(@item).to be_valid
    end
  end

    context '商品出品ができない時' do

      it '画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'ユーザー情報が必須であること' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
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

    it 'カテゴリーのidが1の選択肢を選択すると登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    
    it '商品の状態についてのidが1の選択肢を選択すると登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '配送料の負担についてのidが1の選択肢を選択すると登録できない' do
    @item.delivery_charge_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end

    it '発送元の地域についてのidが1の選択肢を選択すると登録できない' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '発送までの日数についてのidが1の選択肢を選択すると登録できない' do
    @item.delivery_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end

    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end
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

    it '販売価格は英数混合では登録できないこと' do
      @item.price = '1a'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
    end

    it '販売価格は半角英語のみでは登録できないこと' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
    end
  end
end