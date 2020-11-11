require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @contact = FactoryBot.build(:contact)
  end

  context "保存できる場合" do
    it "全ての情報が揃っていれば登録できる" do
      expect(@contact).to be_valid
    end

    it "Titleが空でも登録できる" do
      @contact.title = nil
      expect(@contact).to be_valid
    end
  end

  context "保存できない場合" do
    it "textが空では登録できない" do
      @contact.text = nil
      @contact.valid?
      expect(@contact.errors.full_messages).to include("Text can't be blank")
    end

    it "userが紐付いていなければ登録できない" do
      @contact.user = nil
      @contact.valid?
      expect(@contact.errors.full_messages).to include("User must exist")
    end

    it "storeが紐付いていなければ登録できない" do
      @contact.store = nil
      @contact.valid?
      expect(@contact.errors.full_messages).to include("Store must exist")
    end

  end 
end
