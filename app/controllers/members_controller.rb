class MembersController < ApplicationController
  before_action :set_store, only: [:index, :new, :destroy]

  def index
    @message = "#{@store.store_name}のスタッフ一覧"
    @delete_message = params[:delete_message]
  end
  
  def show
  end

  def new
  end

  def destroy
    member = Member.find(params[:id])
    @user = User.find(member.user_id)
    @delete_message = "#{@user.name}さんを外しました"
    member.destroy
    if member.valid?
      @delete_message = "#{@user.name}さんを外しました"
      return redirect_to store_members_path(@store.id,delete_message: @delete_message)
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
