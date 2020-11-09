require 'rails_helper'

RSpec.describe Table, type: :model do
  before do
    @table = FactoryBot.build(:table)
  end

  context 'tableが保存できる場合' do
    it '全ての情報が揃っていれば保存できる' do
      expect(@table).to be_valid
    end
  end

  context 'tableが保存できない場合' do
    it 'workdayが空だと登録できない' do
      @table.workday = nil
      @table.valid?
      expect(@table.errors.full_messages).to include("Workday can't be blank")
    end

    it 'startが空だと登録できない' do
      @table.start = nil
      @table.valid?
      expect(@table.errors.full_messages).to include("Start can't be blank")
    end

    it 'endingが空だと登録できない' do
      @table.ending = nil
      @table.valid?
      expect(@table.errors.full_messages).to include("Ending can't be blank")
    end

    it 'userが紐付いていないと登録できない' do
      @table.user = nil
      @table.valid?
      expect(@table.errors.full_messages).to include('User must exist')
    end

    it 'storeが紐付いていないと登録できない' do
      @table.store = nil
      @table.valid?
      expect(@table.errors.full_messages).to include('Store must exist')
    end
  end
end
