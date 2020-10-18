class StoresController < ApplicationController

  def index
    # render :new

  end

  def new
    @store = Store.new
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
    params.require(:store).permit(:store_name, :tel, :opening, :closing).merge(user_id: current_user.id)
  end
end
