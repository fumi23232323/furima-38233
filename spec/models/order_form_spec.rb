require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品が購入ができるとき' do
     it '全ての項目が入力されていると保存できる' do
      expect(@order_form).to be_valid
     end
    it '郵便番号が「3桁ハイフン4桁」の組み合わせであれば保存できる' do
      @order_form.postal_code = '123-4560'
      expect(@order_form).to be_valid
    end
    it '都道府県が「---」以外かつ空でなければ保存できる' do
      @order_form.prefecture_id = 1
      expect(@order_form).to be_valid
    end
    it '市区町村が空でなければ保存できる' do
      @order_form.city = '札幌市'
      expect(@order_form).to be_valid
    end
    it '番地が空でなければ保存できる' do
      @order_form.block = '中央区１２３'
      expect(@order_form).to be_valid
    end
    it '建物名が空でも保存できる' do
      @order_form.building = nil
      expect(@order_form).to be_valid
    end
    it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
      @order_form.phonenumber = 12345678910
      expect(@order_form).to be_valid
    end
    it 'トークンが空でなければ保存できる' do
      @order_form.token = 12345678901234567890123
      expect(@order_form).to be_valid
    end
  end

    context '購入ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が入力されていないと保存できない' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do 
        @order_form.postal_code = 1234567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が入力されていないと保存できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が「---」だと保存できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が入力されていないと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていないと保存できない' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が入力されていないと保存できない' do
        @order_form.phonenumber = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.phonenumber = '123-234-1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phonenumber is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_form.phonenumber = 12356789101234
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phonenumber is invalid')
      end
      it '電話番号が９桁以下の時は保存できないこと' do
        @order_form.phonenumber = 1234567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phonenumber is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      
    end
   end
end
