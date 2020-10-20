class StoresController < ApplicationController
  before_action :authenticate_user!

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
    @admin = Admin.where(member_id: @member[0].id)
    if @member[0] != nil
      if @member[0].user_id != current_user.id
        redirect_to root_path
      end
    elsif @store.user_id != current_user.id
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

  def store_params
    params.require(:store).permit(:store_name, :tel, :opening, :closing,).merge(user_id: current_user.id)
  end
end
