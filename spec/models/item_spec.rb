require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品登録ができるとき' do
     it '全ての項目が入力されていると登録できる' do
      expect(@item).to be_valid
     end
  end

    context '出品ができないとき' do
      
      it '画像が1枚添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が入力されていないと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が入力されていないと出品できない' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーが「---」だと出品できない' do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be other than 0")
      end
      it 'カテゴリーが空欄だと出品できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it '商品の状態が「---」だと出品できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 0")
      end
      it '商品の状態が空欄だと出品できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it '配送料の負担が「---」だと出品できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it '配送料の負担が空欄だと出品できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送元の地域が空欄だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が「---」だと出品できない' do
        @item.delivery_days_id =  0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 0")
      end
      it '発送までの日数が空欄だと出品できない' do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
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
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
   end
end
