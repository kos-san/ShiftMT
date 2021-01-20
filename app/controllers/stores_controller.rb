class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:index, :show]
  before_action :set_admin, only: [:index, :show, :destroy]

  def index
    # render :new
  end

  def new
    @store = Store.new
  end

  def show
    @stores = Store.all
    @members = Member.all
    @member = Member.where(user_id: current_user.id)
    @admin = Admin.where(member_id: @member[0].id) if current_user.id != @store.user_id
    redirect_to root_path unless @current_store_member
  end

  def destroy
    store = Store.find(params[:id])
    shifts = Shift.where(store_id: store.id)
    unless shifts.nil?
      shifts.each do |shift|
        shift.destroy
      end
    end
    members = Member.where(store_id: store.id)
    unless members.nil?
      members.each do |member|
        @user = User.find(member.user_id)
        if @current_store_admin
          admins = Admin.where(member_id: member.id)
          admins.each do |admin|
            admin.destroy
          end
        end
        member.destroy
      end
    end
    store.destroy
    redirect_to root_path
  end

  def create
    @store = Store.new(store_params)
    if @store.valid?
      @store.save
      @member = Member.create(user_id: @store.user_id, store_id: @store.id, admin: true)
      redirect_to spaces_path
    else
      render :new
    end
  end

  private

  # 店舗ページのメンバーであればtrueを返すようにする
  def set_member
    @store = Store.find(params[:id])
    @store.members.each do |member|
      if member.user_id == current_user.id
        return @current_store_member = true
      else
        @current_store_member = false
      end
    end
    @current_store_member = true if @store.user_id == current_user.id
  end

  # 店舗ページの管理者であればtrueを返すようにする
  def set_admin
    @store = Store.find(params[:id])
    @store.admins.each do |admin|
      if admin.member.user_id == current_user.id
        return @current_store_admin = true
      else
        @current_store_admin = false
      end
    end
    @current_store_admin = true if @store.user_id == current_user.id
  end

  def store_params
    params.require(:store).permit(:store_name, :tel, :opening, :closing).merge(user_id: current_user.id)
  end
end
