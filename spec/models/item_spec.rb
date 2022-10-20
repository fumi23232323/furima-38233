require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品登録ができるとき' do
     it '全ての項目が入力されていると登録できる' do
      expect(@item).to be_valid
     end
     it 'カテゴリーが「---」以外を選択されれば登録できる' do
      @item.item_category_id = 1
      expect(@item).to be_valid
    end
    it '商品の状態が「---」以外を選択されれば登録できる' do
      @item.item_status_id = 1
      expect(@item).to be_valid
    end
    it '配送料の負担が「---」以外を選択されれば登録できる' do
      @item.delivery_charge_id = 1
      expect(@item).to be_valid
    end
    it '発送元の地域が「---」以外を選択されれば登録できる' do
      @item.prefecture_id = 1
      expect(@item).to be_valid
    end
    it '発送までの日数が「---」以外を選択されれば登録できる' do
      @item.delivery_days_id = 1
      expect(@item).to be_valid
    end
     it '価格は半角数値で、かつ300円〜9,999,999円であれば登録できる' do
      @item.price = 500
      expect(@item).to be_valid
    end
  end

    context '出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
      end
      it '画像が1枚添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が入力されていないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item Name can't be blank")
      end
      it '商品の説明が入力されていないと出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item Description can't be blank")
      end
      it 'カテゴリーが「---」だと出品できない' do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item Category must be other than 0")
      end
      it '商品の状態が「---」だと出品できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item Status must be other than 0")
      end
      it '配送料の負担が「---」だと出品できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery Charge must be other than 0k")
      end
      it '発送元の地域が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数が「---」だと出品できない' do
        @item.delivery_days_id =  0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 0")
      end
      it '価格が入力されていないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が全角数値だと出品できない' do
        @item.price = ５００
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be entered in half size numbers")
      end
      it '商品名が入力されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が入力されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
   end
end
