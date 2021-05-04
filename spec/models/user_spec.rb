require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが半角英字のみでは登録できないこと' do
      @user .password = 'abcdef'
      @user.valid?
      expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが半角数字のみでは登録できないこと' do
      @user .password = '123456'
      @user.valid?
      expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a0000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors[:first_name]).to include("Full-width characters")
    end

    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors[:last_name]).to include("Full-width characters")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("Full-width characters")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("Full-width characters")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:first_name]).to include("Full-width characters")
    end

    it 'last_nameが全角入力でなければ登録できないこと' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:last_name]).to include("Full-width characters")
    end

    it 'first_name_kanaが全角入力でなければ登録できないこと' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("Full-width characters")
    end

    it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("Full-width characters")
    end

    it 'birthdayがない場合は登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end