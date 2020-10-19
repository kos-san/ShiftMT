class SpacesController < ApplicationController
  def index
    @user = User.create
    @stores = Store.all
    @members = Member.all
  end
end
