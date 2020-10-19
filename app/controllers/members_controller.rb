class MembersController < ApplicationController

  def index
  end
  def show
  end
  def new
    @users = User.all
    @store = Store.find(params[:store_id])
  end

end
