require 'rails_helper'

RSpec.describe Shift, type: :model do
  before do
    @shift = FactoryBot.build(:shift)
  end

  context 'shiftsテーブルに保存できる場合' do
    it '全ての情報が揃っていれば登録できる' do
      expect(@shift).to be_valid
    end
    it 'textが空でも登録できる' do
      @shift.text = ''
      expect(@shift).to be_valid
    end
  end

  context 'shiftsテーブルに保存できない場合' do
    it 'workdayが空では登録できない' do
      @shift.workday = nil
      @shift.valid?
      expect(@shift.errors.full_messages).to include("Workday can't be blank")
    end

    it 'startが空では登録できない' do
      @shift.start = nil
      @shift.valid?
      expect(@shift.errors.full_messages).to include("Start can't be blank")
    end

    it 'endingが空では登録できない' do
      @shift.ending = nil
      @shift.valid?
      expect(@shift.errors.full_messages).to include("Ending can't be blank")
    end

    it 'userが紐付いていなければ登録できない' do
      @shift.user = nil
      @shift.valid?
      expect(@shift.errors.full_messages).to include('User must exist')
    end

    it 'storeが紐付いていなければ登録できない' do
      @shift.store = nil
      @shift.valid?
      expect(@shift.errors.full_messages).to include('Store must exist')
    end
  end
end
