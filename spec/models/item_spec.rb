require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品出品できるとき' do
      it 'imageとnameとexplanationとcategory_idとstate_idとburden_idとarea_idとdays_idとpriceが存在していれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない'do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない'do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない'do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'state_idが空では登録できない'do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State Select")
      end
      it 'burden_idが空では登録できない'do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Select")
      end
      it 'area_idが空では登録できない'do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it 'days_idが空では登録できない'do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days Select")
      end
      it 'priceが空では登録できない'do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが1の時は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'state_idが1の時は登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State Select")
      end
      it 'days_idが1の時は登録できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days Select")
      end
      it 'area_idが1の時は登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it 'burden_idが1の時は登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Select")
      end
      it 'priceの値が全角を含む場合は登録できない' do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceの値が半角英字を含む場合は登録できない' do
        @item.price = "test"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceの値が指定範囲外の時は登録できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

    end

  end
end
