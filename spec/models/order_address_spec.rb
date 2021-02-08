require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it 'tokenとpostal_codeとarea_idとmunicipalityとtownとphone_numberが存在していれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'area_idが1の時は登録できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area Select')
      end
      it 'municipalityが空では登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'townが空では登録できない' do
        @order_address.town = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeが数字3桁-数字4桁以外では登録できない' do
        @order_address.postal_code = 'test'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeにハイフンが含まれていない場合は登録できない' do
        @order_address.postal_code = '0123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'phone_numberが漢字では登録できない' do
        @order_address.phone_number = '電話番号'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberがひらがなでは登録できない' do
        @order_address.phone_number = 'てすと'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberがカタカナでは登録できない' do
        @order_address.phone_number = 'テスト'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberが全角数字では登録できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberにハイフンが含まれている場合は登録できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberが12桁以上の場合は登録できない' do
        @order_address.phone_number = '0901234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberに半角英字が含まれている場合は登録できない' do
        @order_address.phone_number = '090test1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'item_idが存在しなければ登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが存在しなければ登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      end
  end
end
