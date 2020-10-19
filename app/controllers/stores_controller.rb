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
    @store.members.each do |member|
      unless current_user.id == (member.user_id || @store.user_id)
        redirect_to root_path
      end
    end
    @stores = Store.all
    @members = Member.all
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
