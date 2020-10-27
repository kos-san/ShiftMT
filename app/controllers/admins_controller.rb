class AdminsController < ApplicationController
  before_action :set_member
  before_action :set_admin

  def index
  end

  def new
    
    @admins = Admin.all
  end

  def create
    member_id = params[:member_id]
    store_id = params[:store_id]
    @admin = Admin.new(member_id: member_id, store_id: store_id)
    if @admin.valid?
      @admin.save
      redirect_to store_members_path
    end
  end

  private

  # 店舗ページのメンバーであればtrueを返すようにする
  def set_member
    @member = Member.find(params[:member_id])
    @user = User.find(@member.user_id)
    @store = Store.find(params[:store_id])
    @store.members.each do |member|
      if member.user_id == @user.id
        return @current_store_member = true
      else
        @current_store_member = false
      end
    end
    if @store.user_id == current_user.id
      @current_store_member = true
    end
  end

  # 店舗ページの管理者であればtrueを返すようにする
  def set_admin
    @member = Member.find(params[:member_id])
    @user = User.find(@member.user_id)
    @store = Store.find(params[:store_id])
    @store.admins.each do |admin|
      if admin.member.user_id == @user.id
        return @current_store_admin = true
      else
        @current_store_admin = false
      end
    end
    if @store.user_id == @user.id
      @current_store_admin = true
    end
  end

end
