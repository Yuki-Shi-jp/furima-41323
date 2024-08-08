require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能のバリデーション' do
    context '正常系' do
      it '全ての値が正しい場合、保存できること' do
        expect(@order_address).to be_valid
      end
    end

    context '異常系' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「３桁ハイフン４桁」の半角文字列のみ保存可能であること' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が必須であること' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が必須であること' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '建物名は任意であること' do
        @order_address.building_name = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end

      it '電話番号が必須であること' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁以上11桁以内の半角数値のみ保存可能であること' do
        @order_address.phone_number = '123456789' # 9桁（短すぎる）
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')

        @order_address.phone_number = '123456789012' # 12桁（長すぎる）
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')

        @order_address.phone_number = '123-4567-890' # ハイフンが含まれている
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')

        @order_address.phone_number = '1234567890' # 10桁（正常系）
        expect(@order_address).to be_valid

        @order_address.phone_number = '09012345678' # 11桁（正常系）
        expect(@order_address).to be_valid
      end
    end
  end
end
