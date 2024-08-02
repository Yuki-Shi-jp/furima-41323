require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品機能のバリデーション' do
    context '正常系' do
      it '全ての値が正しい場合、商品情報がデータベースに保存されること' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it '商品画像を１枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it '商品名が必須であること' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors[:product_name]).to include("can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors[:product_description]).to include("can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include('must be other than 1')
      end

      it '商品の状態の情報が必須であること' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors[:sales_status_id]).to include('must be other than 1')
      end

      it '配送料の負担の情報が必須であること' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors[:shipping_fee_status_id]).to include('must be other than 1')
      end

      it '発送元の地域の情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include('must be other than 1')
      end

      it '発送までの日数の情報が必須であること' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors[:scheduled_delivery_id]).to include('must be other than 1')
      end

      it '価格の情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '価格は、¥300以上のみ保存可能であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it '価格は、¥9,999,999以下のみ保存可能であること' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.price = '三百'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end

      it 'userと紐付いてなければ保存できない' do
        @item.user = nil
        expect(@item).not_to be_valid
        expect(@item.errors[:user]).to include('must exist')
      end
    end
  end
end
