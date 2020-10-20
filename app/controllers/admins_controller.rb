class AdminsController < ApplicationController

  def index
  end

  def new
    @member = Member.find(params[:member_id])
    @user = User.find(@member.user_id)
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

end
