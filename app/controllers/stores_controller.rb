class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:index, :show]
  before_action :set_admin, only: [:index, :show]

  def index
    # render :new

  end

  def new
    @store = Store.new
  end

  def show
    @store = Store.find(params[:id])
    @stores = Store.all
    @members = Member.all
    @member = Member.where(user_id: current_user.id)
    if current_user.id != @store.user_id
      @admin = Admin.where(member_id: @member[0].id)
    end
    unless @current_store_member  #メンバーでなければトップページへリダイレクトされる
      redirect_to root_path
    end
  end

  def create
    @store = Store.new(store_params)
    if @store.valid?
      @store.save
      redirect_to spaces_path
    else
      render :new
    end
  end

  private

  # 店舗ページのメンバーであればtrueを返すようにする
  def set_member
    store = Store.find(params[:id])
    store.members.each do |a|
      if a.user_id == current_user.id || store.user_id == current_user.id #メンバーに店舗テーブルとアソシエーションされたユーザーも加える
        return @current_store_member = true
      else
        @current_store_member = false
      end
    end
  end

  # 店舗ページの管理者であればtrueを返すようにする
  def set_admin
    store = Store.find(params[:id])
    store.admins.each do |a|
      if a.member.user_id == current_user.id || store.user_id == current_user.id #店舗テーブルのuser_idは管理者になる
        return @current_store_admin = true
      else
        @current_store_admin = false
      end
    end
  end

  def store_params
    params.require(:store).permit(:store_name, :tel, :opening, :closing,).merge(user_id: current_user.id)
  end
end
