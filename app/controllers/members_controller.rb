class MembersController < ApplicationController
  before_action :set_store, only: [:index, :new]

  def index
  end
  
  def show
  end

  def new
  end

  def create
    user_id = params[:user_id]
    store_id = params[:store_id]
    @member = Member.new(user_id: user_id, store_id: store_id)
    if @member.valid?
      @member.save
      redirect_to root_path
    end
  end

  def search
    if params[:phone_num].present?
      @user = User.where(phone_num: "#{params[:phone_num]}")[0]
    end
    @member = Member.new
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end


  

end
