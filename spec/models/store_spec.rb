require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '店舗登録機能' do
    it '全ての項目が入力されていれば登録できる' do
      expect(@store).to be_valid
    end
    it 'store_nameが空だと登録できない' do
      @store.store_name = nil
      @store.valid?
      expect(@store.errors.full_messages).to include("Store name can't be blank")
    end
    it '登録されたstore_nameでは登録できない' do
      @store.save
      another_store = FactoryBot.build(:store)
      another_store.tel = '1234561234'
      another_store.valid?
      expect(another_store.errors.full_messages).to include('Store name has already been taken')
    end
    it 'telが空だと登録できない' do
      @store.tel = nil
      @store.valid?
      expect(@store.errors.full_messages).to include("Tel can't be blank")
    end
    it '登録されたtelでは登録できない' do
      @store.save
      another_store = FactoryBot.build(:store)
      another_store.store_name = 'B店'
      another_store.valid?
      expect(another_store.errors.full_messages).to include('Tel has already been taken')
    end
    it 'telが半角英数でないと登録できない' do
      @store.tel = '０１２３４５６７８９'
      @store.valid?
      expect(@store.errors.full_messages).to include('Tel を正しく入力してください')
    end
    it 'telが10または11桁の半角数字でないと登録できない。' do
      @store.tel = '123'
      @store.valid?
      expect(@store.errors.full_messages).to include('Tel を正しく入力してください')
    end
    it 'openingが空だと登録できない' do
      @store.opening = nil
      @store.valid?
      expect(@store.errors.full_messages).to include("Opening can't be blank")
    end
    it 'openingが半角数字でないと登録できない' do
      @store.opening = '１０'
      @store.valid?
      expect(@store.errors.full_messages).to include('Opening is not a number')
    end
    it 'openingが０〜23までの数値でないと登録できない' do
      @store.opening = 50
      @store.valid?
      expect(@store.errors.full_messages).to include('Opening must be less than or equal to 23')
    end
    it 'closingが空だと登録できない' do
      @store.closing = nil
      @store.valid?
      expect(@store.errors.full_messages).to include("Closing can't be blank")
    end
    it 'closingが半角数字でないと登録できない' do
      @store.closing = '１０'
      @store.valid?
      expect(@store.errors.full_messages).to include('Closing is not a number')
    end
    it 'clogingが0~23までの数値でないと登録できない' do
      @store.closing = 50
      @store.valid?
      expect(@store.errors.full_messages).to include('Closing must be less than or equal to 23')
    end
  end
end
