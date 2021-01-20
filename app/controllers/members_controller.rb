class MembersController < ApplicationController
  before_action :set_store, only: [:index, :new, :destroy]
  before_action :set_admin, only: [:destroy]

  def index
    @message = "#{@store.store_name}のスタッフ一覧"
    @delete_message = params[:delete_message]
    @members = Member.where(store_id: @store.id)
  end

  def show
  end

  def new
  end

  def destroy
    member = Member.find(params[:id])
    @user = User.find(member.user_id)
    if @current_store_admin
      admins = Admin.where(member_id: @member.id)
      admins.each do |admin|
        admin.destroy
      end
    end
    member.destroy
    if member.valid?
      @delete_message = "#{@user.name}さんを外しました"
      return redirect_to store_members_path(@store.id, delete_message: @delete_message)
    end
    redirect_to store_members_path
  end

  def create
    user_id = params[:user_id]
    store_id = params[:store_id]
    @member = Member.new(user_id: user_id, store_id: store_id)
    if @member.valid?
      @member.save
      redirect_to store_path(store_id)
    end
  end

  def search
    @user = User.where(phone_num: params[:phone_num].to_s)[0] if params[:phone_num].present?
    @member = Member.new
  end

  private

  # 店舗ページの管理者であればtrueを返すようにする
  def set_admin
    @admin = false
    @store = Store.find(params[:id])
    @members = Member.where(store_id: @store.id)
    @members.each do |member|
      if  member.user_id == current_user.id && member.admin == true
        @admin = true
      end
    end
  end

  def set_store
    @store = Store.find(params[:store_id])
  end
end
